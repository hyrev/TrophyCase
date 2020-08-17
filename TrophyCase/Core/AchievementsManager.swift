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
    var sectionTitle_en: String
    var sectionAchievements: [Achievement]
}

class AchievementsManager
{
    var achievementSections: [AchievementsSection]
    
    init()
    {
        let localContentURL = Bundle.main.url(forResource: "achievements", withExtension: "json")
        achievementSections = AchievementsManager.parseJSON(from: localContentURL) ?? []
    }
    
    fileprivate static func parseJSON(from jsonURL: URL?) -> [AchievementsSection]?
    {
        guard let jsonURL = jsonURL else
        {
            return nil
        }
        
        do
        {
            let achievementData = try Data.init(contentsOf: jsonURL)
            let achievementJSON = try JSONSerialization.jsonObject(with: achievementData,
                                                                   options: .allowFragments) as! Dictionary<String, Any>
            
            if let sectionJSON = achievementJSON["achievements"] as? [Dictionary<String, Any>]
            {
                var tempSections: [AchievementsSection] = []
                for sectionObj in sectionJSON
                {
                    if let sectionTitle = sectionObj[SectionKeys.header_en] as? String,
                       let sectionAchievements = sectionObj[SectionKeys.achievements] as? [Dictionary<String, Any>]
                    {
                        var tempAchievements: [Achievement] = []
                        for achievementObj in sectionAchievements
                        {
                            if let achievement = Achievement.init(json: achievementObj)
                            {
                                tempAchievements.append(achievement)
                            }
                        }
                        
                        let section = AchievementsSection.init(sectionTitle_en: sectionTitle,
                                                               sectionAchievements: tempAchievements)
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
