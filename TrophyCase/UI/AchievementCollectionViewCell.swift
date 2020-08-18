//
//  AchievementCollectionViewCell.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell
{
    static let reuseID = "achievement_cell"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setupWithAchievement(_ achievement:Achievement)
    {
        icon.image = achievement.getIconImage()
        titleLabel.text = achievement.title_en
        valueLabel.text = achievement.currentValue
        
        setIsAchieved(achievement.isAchieved)
    }
    
    fileprivate func setIsAchieved(_ isAchieved: Bool)
    {
        //normally we would want to dim the icon as well, but the icon I currently
        //have has the alpha baked in, so skip for now
        //icon.alpha = (isAchieved ? 1.0 : 0.5)
        titleLabel.alpha = (isAchieved ? 1.0 : 0.5)
        valueLabel.alpha = (isAchieved ? 1.0 : 0.5)
        if !isAchieved
        {
            valueLabel.text = NSLocalizedString("achievement.locked", comment: "")
        }
    }
}
