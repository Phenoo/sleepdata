//
//  SleepViewModel.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 28/08/2024.
//

import Foundation

class SleepViewModel: ObservableObject {
    
    @Published var sleepData = [SleepEntry]()
    
    var totalSleepQuality: Int {
        sleepData.reduce(0) { $0 + $1.quality }
    }
    
    var lastTotalSleepQuality: Int = 0
    
    var medianSleepQuality: Double {
        let sleepData = self.averageSleepQualityByWeekday
        return calculateMedian(sleepData: sleepData) ?? 0
    }
    
    func calculateMedian(sleepData: [(number: Int, quality: Double)]) -> Double? {
        let qualities = sleepData.map { $0.quality }.sorted()
        let count = qualities.count

        if count % 2 == 0 {
            let middleIndex = count / 2
            let median = (qualities[middleIndex - 1] + qualities[middleIndex]) / 2
            return Double(median)
        } else {
            let middleIndex = count / 2
            return Double(qualities[middleIndex])
        }
    }
    
    var sleepQualityByDay: [(day: Date, quality: Int)] {
        let sleepByDay = sleepGroupedByDay(sleep: sleepData)
        return totalQualityPerDate(sleepByDate: sleepByDay)
    }
    
    var sleepQualityByWeek: [(day: Date, quality: Int)] {
        let sleepByWeek = sleepGroupedByWeek(sleep: sleepData)
        return totalQualityPerDate(sleepByDate: sleepByWeek)
    }
    
    var sleepQualityByMonth: [(day: Date, quality: Int)] {
        let sleepByMonth = sleepGroupedByMonth(sleep: sleepData)
        return totalQualityPerDate(sleepByDate: sleepByMonth)
    }
    
    var averageSleepQualityByWeekday: [(number: Int, quality: Double)] {
        let sleepByWeekday = sleepGroupedByWeekday(sleep: sleepData)
        let averageQuality = averageQualityPerNumber(sleepByNumber: sleepByWeekday)
        let sorted = averageQuality.sorted { $0.number < $1.number }
        return sorted
    }
    
    var sleepQualityByWeekday: [(number: Int, sleep: [SleepEntry])] {
        let sleepByWeekday = sleepGroupedByWeekday(sleep: sleepData).map {
            (number: $0.key, sleep: $0.value)
        }
        
        return sleepByWeekday.sorted { $0.number < $1.number }
    }
    
    var sleepQualityByWeekdayHistogramData: [(number: Int, histogram: [(bucket: Int, count: Int)])] {
        var result = [(number: Int, histogram: [(bucket: Int, count: Int)])]()
        let sleepByWeekday = self.sleepQualityByWeekday
        for data in sleepByWeekday {
            result.append((number: data.number, histogram: histogram(for: data.sleep, bucketSize: 5)))
        }
        return result
    }
    
    var highestSleepQualityWeekday: (number: Int, quality: Double)? {
       averageSleepQualityByWeekday.max(by: { $0.quality < $1.quality })
    }
    
    @Published var sleepEntries = [SleepEntry]()
    
    init() {
        // load sleep quality data
    }
    
    func sleepGroupedByDay(sleep: [SleepEntry]) -> [Date: [SleepEntry]] {
        var sleepByDay: [Date: [SleepEntry]] = [:]
        
        let calendar = Calendar.current
        for entry in sleep {
            let date = calendar.startOfDay(for: entry.date)
            if sleepByDay[date] != nil {
                sleepByDay[date]!.append(entry)
            } else {
                sleepByDay[date] = [entry]
            }
        }
        
        return sleepByDay
    }

    func totalQualityPerDate(sleepByDate: [Date: [SleepEntry]]) -> [(day: Date, quality: Int)] {
        var totalQuality: [(day: Date, quality: Int)] = []
        
        for (date, sleep) in sleepByDate {
            let totalQualityForDate = sleep.reduce(0) { $0 + $1.quality }
            totalQuality.append((day: date, quality: totalQualityForDate))
        }
        
        return totalQuality
    }
    
    func sleepGroupedByWeek(sleep: [SleepEntry]) -> [Date: [SleepEntry]] {
        var sleepByWeek: [Date: [SleepEntry]] = [:]
        
        let calendar = Calendar.current
        for entry in sleep {
            guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: entry.date)) else { continue }
            if sleepByWeek[startOfWeek] != nil {
                sleepByWeek[startOfWeek]!.append(entry)
            } else {
                sleepByWeek[startOfWeek] = [entry]
            }
        }
        
        return sleepByWeek
    }
    
    func sleepGroupedByMonth(sleep: [SleepEntry]) -> [Date: [SleepEntry]] {
        var sleepByMonth: [Date: [SleepEntry]] = [:]
        
        let calendar = Calendar.current
        for entry in sleep {
            guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: entry.date)) else { continue }
            if sleepByMonth[startOfMonth] != nil {
                sleepByMonth[startOfMonth]!.append(entry)
            } else {
                sleepByMonth[startOfMonth] = [entry]
            }
        }
        
        return sleepByMonth
    }
    
    func sleepGroupedByWeekday(sleep: [SleepEntry]) -> [Int: [SleepEntry]] {
        var sleepByWeekday: [Int: [SleepEntry]] = [:]

        let calendar = Calendar.current
        for entry in sleep {
            let weekday = calendar.component(.weekday, from: entry.date)
            if sleepByWeekday[weekday] != nil {
                sleepByWeekday[weekday]!.append(entry)
            } else {
                sleepByWeekday[weekday] = [entry]
            }
        }

        return sleepByWeekday
    }
    
    func averageQualityPerNumber(sleepByNumber: [Int: [SleepEntry]]) -> [(number: Int, quality: Double)] {
        var averageQuality: [(number: Int, quality: Double)] = []

        for (number, sleep) in sleepByNumber {
            let count = sleep.count
            let totalQualityForWeekday = sleep.reduce(0) { $0 + $1.quality }
            averageQuality.append((number: number, quality: Double(totalQualityForWeekday) / Double(count)))
        }

        return averageQuality
    }
    
    func histogram(for sleep: [SleepEntry], bucketSize: Int) -> [(bucket: Int, count: Int)] {
        var histogram: [Int: Int] = [:]
        for entry in sleep {
            let bucket = entry.quality / bucketSize
            histogram[bucket, default: 0] += 1
        }
        return histogram.map { (bucket: $0, count: $1) }.sorted { $0.bucket < $1.bucket  }
    }
    
    static var preview: SleepViewModel {
        let vm = SleepViewModel()
        vm.sleepData = SleepEntry.exampleData
        vm.lastTotalSleepQuality = 700 // Example value
        return vm
    }
}


