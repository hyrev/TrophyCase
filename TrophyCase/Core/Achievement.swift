//
//  Achievement.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class Achievement
{
    let id: String
    let title_en: String
    let currentValue: String
    let isAchieved: Bool
    let imageID: String
    
    init?(json: Dictionary<String, Any>)
    {
        //ensure we have all the fields we expect; if not, don't instantiate
        guard let id = json[AchievementKeys.id] as? String,
              let title_en = json[AchievementKeys.title_en] as? String,
              let currentValue = json[AchievementKeys.currentValue] as? String,
              let isAchieved = json[AchievementKeys.isAchieved] as? Bool,
              let imageID = json[AchievementKeys.imageID] as? String
        else
        {
            return nil
        }
        
        self.id = id
        self.title_en = title_en
        self.currentValue = currentValue
        self.isAchieved = isAchieved
        self.imageID = imageID
    }
    
    func getIconImage() -> UIImage?
    {
        return UIImage.init(named: imageID)
    }
}
