//
//  AchievementsViewController.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    let achievementsManager = AchievementsManager.init()
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell.init()
    }
    
    
}
