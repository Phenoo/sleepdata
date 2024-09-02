//
//  SleepCardView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import SwiftUI

struct SleepCardView: View {
    @State private var workdays: Bool = true
    
    let sleep: Sleep
    
    let days: [String] = ["Mo", "Tu", "Wd", "Th", "Fr", "Sa", "Su"]

    private var timeFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "h:mm a" // 12-hour format with AM/PM
           return formatter
       }
    
    private var timeFormatterWithout: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "h:mm" // 12-hour format with AM/PM
           return formatter
       }
       
       // Formatted bedtime string
       var formattedBedtime: String {
           return timeFormatter.string(from: sleep.bedtime)
       }
    
    var formattedWaketime: String {
        return timeFormatter.string(from: sleep.wakeupTime)
    }
    
    var bedtimeMinus30Minutes: Date {
        return Calendar.current.date(byAdding: .minute, value: -Int(sleep.remindAdavance), to: sleep.bedtime) ?? sleep.bedtime
       }
    
    var wakeupMinus30Minutes: Date {
        return Calendar.current.date(byAdding: .minute, value: -Int(sleep.smartAlarm), to: sleep.wakeupTime) ?? sleep.wakeupTime
       }
    
    var formattedwakeupMinus30Minutes: String {
           return timeFormatterWithout.string(from: bedtimeMinus30Minutes)
       }
    
    var formattedBedtimeMinus30Minutes: String {
           return timeFormatter.string(from: bedtimeMinus30Minutes)
       }
    
    var sleepGoal: String {
        let duration = Calendar.current.dateComponents([.hour, .minute], from: sleep.bedtime, to: sleep.wakeupTime)
            let hours = duration.hour ?? 0
            let minutes = duration.minute ?? 0
            
            return "\(hours)h \(minutes)m"
        }
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                
                    
                    Toggle("Work days", isOn: $workdays)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .toggleStyle(SwitchToggleStyle(tint: Color.lightPurple))

                }
                
                LazyVGrid(columns: [GridItem(.fixed(180)), GridItem(.fixed(180))], spacing: 20) {
                    VStack(alignment: .leading) {
                        Text(sleepGoal)
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Sleep goal")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(alignment: .leading) {
                        Text(formattedBedtimeMinus30Minutes)
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Sleep reminder")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(alignment: .leading) {
                        Text(formattedBedtime)
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Bedtime")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(alignment: .leading) {
                        Text("\(formattedwakeupMinus30Minutes) - \(formattedWaketime)")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Smart alarm - \(Int(sleep.smartAlarm)) min")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)


                }
           
                
            
                
                HStack {
                    ForEach(days, id: \.self) { day in
                        HStack {
                            Text(day)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(sleep.repeatingDays.contains(day) ? Color.darkPurple : Color.lightPurple)
                                .lineLimit(0)
                                .frame(width: 45, height: 45)
                        }
                        .background {
                            Circle()
                                .fill(sleep.repeatingDays.contains(day) ? Color.lightPurple : Color.darkPurple)
                                                            .stroke(Color.lightPurple, lineWidth: 2)
                        }
                        
                        
                    }
                    
                }

            }
            
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10).fill(Color.cardPurple)
            }

        }.padding(.horizontal)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}


