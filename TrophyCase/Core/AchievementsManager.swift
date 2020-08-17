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
    var achievements: [AchievementsSection] = []
    
    init()
    {
        let localContentURL = Bundle.main.url(forResource: "achievements", withExtension: "json")
        do
        {
            let achievementData = try Data.init(contentsOf: localContentURL!)
            let achievementJSON = try JSONSerialization.jsonObject(with: achievementData, options: .allowFragments) as! Dictionary<String, Any>
            
            if let sectionJSON = achievementJSON["achievements"] as? [Dictionary<String, Any>]
            {
               for sectionObj in sectionJSON
               {
                    let sectionTitle = sectionObj["section_header_en"] as? String ?? ""
                    var tempAchievements: [Achievement] = []
                
                    if let sectionAchievements = sectionObj["section_achievements"] as? [Dictionary<String, Any>]
                    {
                        for achievementObj in sectionAchievements
                        {
                            if let achievement = Achievement.init(json: achievementObj)
                            {
                                tempAchievements.append(achievement)
                            }
                        }
                    }
                
                    let section = AchievementsSection.init(sectionTitle_en: sectionTitle,
                                                           sectionAchievements: tempAchievements)
                    achievements.append(section)
               }
            }
        }
        catch
        {
            print("failed to parse local achievements content")
        }
    }
}
