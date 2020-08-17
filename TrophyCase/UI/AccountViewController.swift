//
//  AccountViewController.swift
//  TrophyCase
//
//  Created by Jake on 2020-08-16.
//  Copyright © 2020 Jake. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController
{
    @IBOutlet weak var viewAchievementsButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewAchievementsButton.addTarget(self,
                                         action: #selector(showAchievements),
                                         for: .touchUpInside)
    }
    
    // MARK: Button Listener methods
    
    @objc fileprivate func showAchievements()
    {
        performSegue(withIdentifier: "show_achievements", sender: nil)
    }
    
}
