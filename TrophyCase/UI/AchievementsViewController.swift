//
//  AchievementsViewController.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegate,
                                  UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var actionButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //internal
    let achievementsManager = AchievementsManager.init()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionView.elementKindSectionHeader
        {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "achievement_header", for: indexPath) as? AchievementsSectionHeaderView
            {
            
                headerView.headerLabel.text = achievementsManager.achievementSections[indexPath.section].sectionTitle_en
            
                return headerView
            }
        }
        
        return UIView.init(frame: .zero) as! UICollectionReusableView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return achievementsManager.achievementSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        return achievementsManager.achievementSections[section].sectionAchievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCollectionViewCell.reuseID,
                                                      for: indexPath) as! AchievementCollectionViewCell
        
        let currentAchievement = achievementsManager.achievementSections[indexPath.section].sectionAchievements[indexPath.row]
        cell.setupWithAchievement(currentAchievement)
        
        return cell;
    }
    
    // MARK: UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.frame.size.width
        return CGSize(width: width / 2.0, height: width / 1.5)
    }
}
