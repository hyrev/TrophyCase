//
//  AchievementsManager.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import Foundation

struct AchievementsSection
{
    //normally we'd parse out titles for all supported languages and use them based on device locale,
    //but we'll stick to just english for now
    var sectionTitle_en: String
    var achievements: [Achievement]
    
    func getLocalizedTitle() -> String
    {
        return sectionTitle_en
    }
}

class AchievementsManager
{
    var sections: [AchievementsSection]
    
    init()
    {
        let localContentURL = Bundle.main.url(forResource: "achievements", withExtension: "json")
        sections = AchievementsManager.parseJSON(from: localContentURL) ?? []
    }
   
    /**
     Attempts to parse achievement data from JSON at the specified URL
     - Parameter jsonURL: the location of the JSON data to parse, currently only being used with URL for bundled content
     - Returns: An array of achievement sections in any were parsed successfully, nil otherwise
     */
    fileprivate static func parseJSON(from jsonURL: URL?) -> [AchievementsSection]?
    {
        //If the URL is nil don't bother continuing
        guard let jsonURL = jsonURL else
        {
            return nil
        }
        
        do
        {
            //attempt to read/load the json data
            let achievementData = try Data.init(contentsOf: jsonURL)
            let achievementJSON = try JSONSerialization.jsonObject(with: achievementData,
                                                                   options: .allowFragments) as! Dictionary<String, Any>
            
            //grab the json object we want out of it
            if let sectionJSON = achievementJSON["achievements"] as? [Dictionary<String, Any>]
            {
                //iterate over each of the sections and instantiate it
                var tempSections: [AchievementsSection] = []
                for sectionObj in sectionJSON
                {
                    if let sectionTitle = sectionObj[SectionKeys.header_en] as? String,
                       let sectionAchievements = sectionObj[SectionKeys.achievements] as? [Dictionary<String, Any>]
                    {
                        //iterate over each achievement in the section and instantiate it
                        var tempAchievements: [Achievement] = []
                        for achievementObj in sectionAchievements
                        {
                            if let achievement = Achievement.init(json: achievementObj)
                            {
                                tempAchievements.append(achievement)
                            }
                        }
                        
                        let section = AchievementsSection.init(sectionTitle_en: sectionTitle,
                                                               achievements: tempAchievements)
                        tempSections.append(section)
                    }
                }
                
                return tempSections
            }
        }
        catch
        {
            print("failed to parse achievements from \(jsonURL)")
        }
        
        return nil
    }
}
