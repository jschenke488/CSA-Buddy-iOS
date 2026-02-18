//
//  AppSettings.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/26/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import Foundation

class AppSettings {
    let defaults = UserDefaults.standard
    var fieldMonitor = ""
    
    func load() {
        if let fieldMonitorSetting = defaults.string(forKey: "FieldMonitor") {
            fieldMonitor = fieldMonitorSetting
        }
    }
    
    func save(newFieldMonitor : String) {
        defaults.set(newFieldMonitor, forKey: "FieldMonitor")
        fieldMonitor = newFieldMonitor
    }
}
