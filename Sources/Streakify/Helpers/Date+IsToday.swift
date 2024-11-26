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
}
