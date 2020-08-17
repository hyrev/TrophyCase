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
    @IBOutlet weak var valueTabel: UILabel!
    
    func setupWithAchievement(_ achievement:Achievement)
    {
        self.titleLabel.text = achievement.title_en
        self.valueTabel.text = achievement.currentValue
    }
}
