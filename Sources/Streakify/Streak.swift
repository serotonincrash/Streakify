//
//  Streak.swift
//  Streakify
//
//  Created by Sean on 26/11/24.
//

import Foundation

@Observable
public class Streak: Codable {
    var streakValue: Int = 0
    var lastUpdated: Date = .distantPast
    var key: String
    var shouldStreak: Bool = false
    var streakBroken: Date = .distantPast
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
            print("Streak debug: shouldStreak is \(!lastUpdated.isToday())")
            self.shouldStreak = !lastUpdated.isToday()
        }
    }
    
    public var value: Int {
        // calc the streak here, increment if necessary
        switch self.streakMode {
        case .daily:
            if self.shouldStreak {
                if lastUpdated.isInYesterday() {
                    // streak was updated yesterday and hasn't today
                    // increment
                    self.lastUpdated = .now
                    self.shouldStreak = false
                    self.streakValue += 1
                    save(value: self)
                    return self.streakValue
                } else {
                    // streak should be updated but wasn't streaked yesterday
                    // break the streak (it's reset to 1 because the user now has 1 day logged in)
                    self.lastUpdated = .now
                    self.streakBroken = .now
                    self.shouldStreak = false
                    self.streakValue = 1
                    save(value: self)
                    return self.streakValue
                }
            } else {
                // dont need to affect streak just return the value
                return self.streakValue
            }
        case .manual:
            return self.streakValue
        }
    }
    
    /// Breaks the streak in a manual streak mode.
    public func breakStreak() throws {
        guard self.streakMode == .manual else { throw StreakError.unsupportedMode }
        
    }
    
    
    
    
    /// Increments the streak in a manual streak mode.
    /// Also disables streaking until `shouldStreak` is manually set to `true` again.
    public func incrementStreak() throws {
        guard streakMode == .manual else { throw StreakError.unsupportedMode }
        if self.shouldStreak {
            self.lastUpdated = .now
            self.streakValue += 1
            self.shouldStreak = false
        } else {
            print("incrementStreak called when shouldStreak was false!")
        }
    }
    
    
    
}

