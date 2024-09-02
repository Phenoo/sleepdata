//
//  WeekSleepChartView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 28/08/2024.
//

import SwiftUI
import Charts

struct WeekSleepChartView: View {
    @ObservedObject var sleepViewModel: SleepViewModel
    
    var body: some View {
           VStack(alignment: .leading) {
                   Text("Sleep Quality")
                   .font(.headline)
                   .fontWeight(.semibold)
                   .padding(.bottom)
               
               
               Chart(sleepViewModel.averageSleepQualityByWeekday, id: \.number) {
                       BarMark(x: .value("Day", weekday(for: $0.number)),
                               y: .value("Sales", $0.quality))
                       .foregroundStyle(Color.lightPurple.gradient)
                       .interpolationMethod(.catmullRom)

               }
               .chartXAxis {
                   AxisMarks {
                       
                   }
                   
               }
               .chartYAxis {
                   AxisMarks(position: .leading)
                   
               }
               
               .frame(height: 200)
               
           }
           .padding()
           .frame(maxWidth: .infinity, alignment: .leading)
           .background{
               RoundedRectangle(cornerRadius: 12).fill(Color.cardPurple)
           }
          
       }
       
       let formatter = DateFormatter()
       
       func weekday(for number: Int) -> String {
           formatter.shortWeekdaySymbols[number - 1]
       }
       
       func longWeekday(for number: Int) -> String {
           formatter.weekdaySymbols[number - 1]
       }
   }


#Preview {
    WeekSleepChartView(sleepViewModel: .preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
