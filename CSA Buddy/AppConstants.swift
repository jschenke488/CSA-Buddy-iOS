//
//  AppConstants.swift
//  CSA Buddy
//
//  Centralized constants used across the app.
//  This file includes keys for user settings persisted in app data (UserDefaults).
//

import Foundation

/// A namespace for app-wide constants.
enum AppConstants {
    /// Keys used to store and retrieve values from UserDefaults.
    enum UserDefaultsKeys {
        /// Whether the user has completed or dismissed onboarding.
        static let accessibilityModeEnabled = "accessibilityModeEnabled"
    }
}
