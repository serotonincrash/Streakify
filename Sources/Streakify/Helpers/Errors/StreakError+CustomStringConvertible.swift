//
//  StreakError+CustomStringConvertible.swift
//  Streakify
//
//  Created by Sean on 20/5/25.
//

extension StreakError: CustomStringConvertible {
    var description: String {
        switch self {
        case .unsupportedMode:
            return "This function isn't supported in this streak mode."
        }
    }
}
