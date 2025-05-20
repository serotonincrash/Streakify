//
//  Streak+StreakMode.swift
//  Streakify
//
//  Created by Sean on 26/11/24.
//

public extension Streak {
    // For further development
    enum StreakMode: Codable {
        
        /// A streak mode that increments the streak when the streak value is accessed on a daily basis.
        case daily
        
        /// A streak mode that manually tracks the streak.
        case manual
    }
}
