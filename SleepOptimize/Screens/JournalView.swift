//
//  JournalView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI
import Charts

let backgroundGradient = LinearGradient(
    colors: [Color.red, Color.blue],
    startPoint: .top, endPoint: .bottom)

struct SleepDistribution : Hashable {
    let department: String
    let percentage: Double
}

enum Period: String, CaseIterable {
    case day = "Day"
    case week = "Week"
    case month = "Month"
}

struct JournalView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.lightPurple)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.darkPurple
)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.white
)], for: .normal)
        
    }
    
    enum TimeInterval: String, CaseIterable, Identifiable {
         case day = "Day"
         case week = "Week"
         case month = "Month"
         var id: Self { self }
     }
     @ObservedObject var salesViewModel: SalesViewModel = .preview
     @State private var selectedTimeInterval = TimeInterval.day
     
    @ObservedObject var sleepViewModel: SleepViewModel = .preview

    
    @State private var period: Period = .day
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                Color.darkPurple
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        Picker("", selection: $period) {
                            ForEach(Period.allCases, id: \.self) { showPeriod in
                                Text(showPeriod.rawValue)
                                    .font(.headline)
                            }
                        }
                        .pickerStyle(.segmented)
                        .foregroundStyle(Color.lightPurple)
                        .background(Color.customPurple)
                    }
                    .padding()
                    
                    VStack {
                        switch period {
                        case .day:
                            VStack {
                                DayView()
                               
                            }
                        case .week:
                            VStack {
                                WeekView()
                                WeekSleepChartView(sleepViewModel: sleepViewModel)
                                                            }
                        case .month:
                            VStack {
                                MonthView()
                                MonthChartView(salesViewModel: salesViewModel)
                            }
                       
                        }
                    
                    }.padding()
                }
                .navigationTitle("Sleep journal")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AddSleepJournalView()) {
                            HStack {
                                Text("Add")
                                Image(systemName: "plus")
                                    .font(.subheadline)
                            }
                            .foregroundStyle(Color.lightPurple)
                        }
                    }
                }.background(Color.darkPurple)
            }
        } detail: {
            AddSleepJournalView()        }
    }
}

struct DayView: View {
    
    @State private var selectedDate: String = ""
    
    let data: [SleepDistribution] = [
        SleepDistribution(department: "Awake", percentage: 27),
        SleepDistribution(department: "REM", percentage: 14),
        SleepDistribution(department: "Light Sleep", percentage: 19),
        SleepDistribution(department: "Deep Sleep", percentage: 40)
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                HStack(spacing: 10) {
                    Text("Friday, April 26")
                    Image(systemName: "chevron.down")
                }
                Spacer()
                
                Image("share")
            }
            
            
            HStack(spacing: 10) {
                SleepQualityView()
                VStack(alignment: .leading, spacing: 30) {
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text("In bed")
                                .font(.caption)
                                .foregroundStyle(Color.customGray)
                            Text("6h 12min")
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                   
                        VStack(alignment: .leading) {
                            Text("Asleep")
                                .font(.caption)
                                .foregroundStyle(Color.customGray)
                            Text("5h 45min")
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Breaks")
                            .font(.caption)
                            .foregroundStyle(Color.customGray)
                        Text("4 wakes during the night")
                            .font(.headline)
                            .lineLimit(0)
                            .fontWeight(.semibold)
                            
                    }
                }
                .padding(.top, 20)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background{
                RoundedRectangle(cornerRadius: 12).fill(Color.cardPurple)
            }
            
            
            
            WellnessCoach()
            
            VStack(alignment: .leading) {
                Text("Sleep Distribution")
                    .font(.headline)

                          
                
                
                Chart(data, id: \.self) { // Get the Production values.
                    BarMark(
                        x: .value("Profit", $0.percentage)
                    )
                    .cornerRadius(10)
                    
                    .foregroundStyle(by: .value("Sleep Category", $0.department))
                    .interpolationMethod(.catmullRom)
                    
                }
                .chartForegroundStyleScale(["Awake": Color.customYellow, "REM": Color.lightYellow, "Light Sleep": Color.lightPurple, "Deep Sleep": Color.purePurple])
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background{
                RoundedRectangle(cornerRadius: 12).fill(Color.cardPurple)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("Daily Breakdown")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                HStack {
                    ItemView(icon: "bed.double", name: "Went to bed", subtext: "00:48 am")
                    ItemView(icon: "sun.max.fill", name: "Went to bed", subtext: "07:00 am")
                }
                
                HStack {
                    ItemView(icon: "speaker.wave.2.fill", name: "Went to bed", subtext: "41 db")
                    ItemView(icon: "zzz", name: "Asleep after", subtext: "27 min")

                }
                
              
                    
               
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background{
                RoundedRectangle(cornerRadius: 12).fill(Color.cardPurple)
            }
            
            
            
            
        }
    }
}

struct ItemView: View {
    
    let icon: String
    let name: String
    let subtext: String
    
    var body: some View {
        HStack(content: {
            Image(systemName: icon)
                .font(.headline)
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 10).fill(Color.darkPurple)
                }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.subheadline)
                    .foregroundStyle(Color.customGray)
                Text(subtext)
                    .font(.headline)
            }
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct WeekView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Average sleep metrics")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                HStack {
                    ItemView(icon: "medal.star", name: "Sleep quality", subtext: "87%")
                    ItemView(icon: "zzz", name: "Asleep after", subtext: "27 min")
                }
                
                HStack {
                    ItemView(icon: "bed.double", name: "Went to bed", subtext: "4")
                    ItemView(icon: "zzz", name: "Asleep", subtext: "7h 27 min")

                }
              
                HStack {
                    ItemView(icon: "moon.fill", name: "Went to bed", subtext: "00:32 am")
                    ItemView(icon: "sun.max.fill", name: "Wake up", subtext: "06:40 am")

                }
             
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background{
                RoundedRectangle(cornerRadius: 12).fill(Color.cardPurple)
            }
        }
    }
}

struct MonthView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
        }
    }
}

struct YearView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
        }
    }
}

#Preview {
    JournalView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
