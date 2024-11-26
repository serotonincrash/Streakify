//
//  Streak.swift
//  Streakify
//
//  Created by Sean on 26/11/24.
//

import Foundation

@Observable
class Streak: Codable {
    var streakValue: Int = 0
    var lastUpdated: Date = .now
    var key: String
    var shouldStreak: Bool = false
    var streakMode: StreakMode
    
    public init(key: String, streakMode: StreakMode = .daily) {
        self.key = key
        self.streakMode = streakMode
        let streak = Streak.getValue(key: key)
        if let streak {
            self.streakValue = streak.streakValue
            self.lastUpdated = streak.lastUpdated
            self.streakMode = streak.streakMode
        }
        
        // Determine if has streaked today
        if streakMode == .daily {
            self.shouldStreak = !lastUpdated.isToday()
        }
    }
    
    var value: Int {
        // calc the streak here, increment if necessary
        switch streakMode {
        case .daily:
            if shouldStreak {
                // if this value is being getted it means that its being accessed when it should streak
                self.lastUpdated = .now
                self.shouldStreak = false
                self.streakValue += 1
                save(value: self)
                return streakValue
            } else {
                return streakValue
            }
        case .manual:
            return streakValue
        }
    }
    
}
