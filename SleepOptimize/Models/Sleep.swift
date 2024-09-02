//
//  Sleep.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import Foundation
import SwiftData

@Model

final class Sleep {
    
    var name: String
    var alarmSound: String
    var remindSound: String
    
    var repeatingDays: Set<String>
    
    var wakeupTime: Date
    var bedtime: Date
    
    var smartAlarm: TimeInterval = 30
    var snooze: TimeInterval
    var remindAdavance: TimeInterval

    var remindAlarm: Bool
    var wakeupAlarm : Bool

    

    
    
    init(name: String, wakeupTime: Date, bedtime: Date, wakeupAlarm: Bool = false, alarmSound: String = "Default", snooze: TimeInterval, remindAlarm: Bool = false, remindSound: String, remindAdavance: TimeInterval, repeatingDays: Set<String>
) {
        self.name = name
        self.wakeupTime = wakeupTime
        self.bedtime = bedtime
        self.wakeupAlarm = wakeupAlarm
        self.alarmSound = alarmSound
        self.snooze = snooze
        self.remindAlarm = remindAlarm
        self.remindSound = remindSound
        self.remindAdavance = remindAdavance
        self.repeatingDays = repeatingDays
    }
}
