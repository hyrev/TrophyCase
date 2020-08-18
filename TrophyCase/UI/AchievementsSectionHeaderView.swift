//
//  AchievementsSectionHeaderView.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-17.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class AchievementsSectionHeaderView: UICollectionReusableView
{
    static let reuseID = "achievement_header"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func setupWithSection(_ section: AchievementsSection)
    {
        self.headerLabel.text = section.getLocalizedTitle()
        self.countLabel.text = String.init(format: NSLocalizedString("achievement.count.%d.%d", comment: ""), section.getNumberAchieved(), section.achievements.count)
    }
}
