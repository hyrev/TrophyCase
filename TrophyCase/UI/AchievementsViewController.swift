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
        actionButton.target = self
        actionButton.action = #selector(showOptions)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: Button Listener methods
    
    @objc func showOptions()
    {
        //show a placeholder alert for now, this functionality isn't complete yet
        let controller = UIAlertController.init(title: NSLocalizedString("options.coming-soon.title", comment: ""),
                                                message: NSLocalizedString("options.coming-soon.body", comment: ""),
                                                preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: NSLocalizedString("common.ok", comment: ""),
                                                style: .default,
                                                handler: nil))
        
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: UICollectionViewDataSource methods
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView
    {
        if kind == UICollectionView.elementKindSectionHeader
        {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AchievementsSectionHeaderView.reuseID, for: indexPath) as? AchievementsSectionHeaderView
            {
                headerView.headerLabel.text = achievementsManager.sections[indexPath.section].getLocalizedTitle()
                return headerView
            }
        }
        
        return UICollectionReusableView.init(frame: .zero)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return achievementsManager.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        return achievementsManager.sections[section].achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCollectionViewCell.reuseID,
                                                      for: indexPath) as! AchievementCollectionViewCell
        
        let currentAchievement = achievementsManager.sections[indexPath.section].achievements[indexPath.row]
        cell.setupWithAchievement(currentAchievement)
        
        return cell;
    }
    
    // MARK: UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //make the cells square and half the width of the collectionview
        let width = collectionView.frame.size.width
        return CGSize(width: width / 2.0, height: width / 2.0)
    }
}
