//
//  SleepEntry.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 28/08/2024.
//

import Foundation

struct SleepEntry: Identifiable {
    let id = UUID()           // Unique identifier for each sleep entry
    let date: Date            // Date of the sleep entry
    let duration: TimeInterval // Duration of sleep in seconds
    let quality: Int          // Quality of sleep, represented as an integer (e.g., 0-100)
    
    var hoursSlept: Double {
        return duration / 3600  // Converts the duration from seconds to hours
    }

    init(date: Date, duration: TimeInterval, quality: Int) {
        self.date = date
        self.duration = duration
        self.quality = quality
    }
    
    static var exampleData: [SleepEntry] {
        let calendar = Calendar.current
        return [
            SleepEntry(date: calendar.date(byAdding: .day, value: -6, to: Date())!, duration: 8 * 3600, quality: 80),
            SleepEntry(date: calendar.date(byAdding: .day, value: -5, to: Date())!, duration: 7.5 * 3600, quality: 75),
            SleepEntry(date: calendar.date(byAdding: .day, value: -4, to: Date())!, duration: 9 * 3600, quality: 85),
            SleepEntry(date: calendar.date(byAdding: .day, value: -3, to: Date())!, duration: 8.5 * 3600, quality: 90),
            SleepEntry(date: calendar.date(byAdding: .day, value: -2, to: Date())!, duration: 7 * 3600, quality: 70),
            SleepEntry(date: calendar.date(byAdding: .day, value: -1, to: Date())!, duration: 6 * 3600, quality: 60),
            SleepEntry(date: Date(), duration: 9.5 * 3600, quality: 95)
        ]
    }
}
