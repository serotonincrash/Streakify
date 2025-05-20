// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftUI

@propertyWrapper public struct Streaked: DynamicProperty {
    
    @State public var streak: Streak
    
    public var key: String
    public init(_ key: String) {
        self.key = key
        self.streak = Streak(key: key)
    }
    
    public init(_ key: String, streakMode: Streak.StreakMode) {
        self.key = key
        self.streak = Streak(key: key, streakMode: streakMode)
    }
    
    public var wrappedValue: Streak {
        get {
            streak
        }
    }
    
    
}
