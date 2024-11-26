//
//  File.swift
//  Streakify
//
//  Created by Sean on 26/11/24.
//

import Foundation

extension Streak {
    static func getArchiveURL(from key: String) -> URL {
        let plistName = "\(key).plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(plistName)
        
        return documentsDirectory
    }
    
    func save(value: Streak) {
        let archiveURL = Streak.getArchiveURL(from: key)
        let propertyListEncoder = JSONEncoder()
        let encodedValue = try? propertyListEncoder.encode(value)
        try? encodedValue?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func getValue(key: String) -> Streak? {
        let archiveURL = getArchiveURL(from: key)
        let propertyListDecoder = JSONDecoder()
        
        if let retrievedValueData = try? Data(contentsOf: archiveURL),
           let decodedValue = try? propertyListDecoder.decode(Streak.self, from: retrievedValueData) {
            return decodedValue
        }
        return nil
    }
}
