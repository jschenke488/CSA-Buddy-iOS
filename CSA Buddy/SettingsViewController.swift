//
//  SettingsViewController.swift
//  CSA Buddy
//
//  Created by Ken on 3/18/26.
//  Copyright © 2026 Ken Schenke. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var accessibilityModeEnabledSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accessibilityModeEnabled = UserSettings.shared.accessibilityModeEnabled
        accessibilityModeEnabledSwitch.setOn(accessibilityModeEnabled, animated: false)
    }
    
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        UserSettings.shared.accessibilityModeEnabled = sender.isOn
    }
    
}
