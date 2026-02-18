//
//  MainTabViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/26/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit
import FontAwesome_swift

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize(width: 32, height: 32)
        tabBar.items?[0].image = UIImage.fontAwesomeIcon(name: .desktop, style: .solid,
                                                         textColor: UIColor.blue, size: size)
        tabBar.items?[1].image = UIImage.fontAwesomeIcon(name: .stickyNote, style: .solid,
                                                         textColor: UIColor.blue, size: size)
        tabBar.items?[2].image = UIImage.fontAwesomeIcon(name: .book, style: .solid,
                                                         textColor: UIColor.blue, size: size)
        tabBar.items?[3].image = UIImage.fontAwesomeIcon(name: .infoCircle, style: .solid,
                                                         textColor: UIColor.blue, size: size)
    }
    
}
