//
//  UserSettings.swift
//  CSA Buddy
//
//  A simple, typed wrapper around UserDefaults to manage persistent user settings.
//

import Foundation

/// Strongly-typed persistent user settings stored in app data (UserDefaults).
final class UserSettings {
    static let shared = UserSettings()
    private let defaults: UserDefaults

    // MARK: - Initialization
    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    // MARK: - Keys
    private enum Keys {
        static let accessibilityModeEnabled = AppConstants.UserDefaultsKeys.accessibilityModeEnabled
    }

    // MARK: - Properties

    /// Whether the user has completed or dismissed onboarding.
    var accessibilityModeEnabled: Bool {
        get { defaults.bool(forKey: Keys.accessibilityModeEnabled) }
        set { defaults.set(newValue, forKey: Keys.accessibilityModeEnabled) }
    }

    // MARK: - Utilities

    /// Resets all user settings to their default values.
    func reset() {
        defaults.removeObject(forKey: Keys.accessibilityModeEnabled)
        defaults.synchronize()
    }
}
