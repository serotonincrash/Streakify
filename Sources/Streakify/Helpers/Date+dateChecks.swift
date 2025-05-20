//
//  Date+IsInPastDay.swift
//  Streakify
//
//  Created by Sean on 26/11/24.
//

import Foundation

extension Date {
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func isInYesterday() -> Bool {
        // check if date is in the day before (86400 seconds before)
        return Calendar.current.isDate(self, inSameDayAs: .now.addingTimeInterval(-86400))
    }
}
