//
//  AddSleepScheduleView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 21/08/2024.
//

import SwiftUI


struct AddSleep {
    var name: String = ""
    var alarmSound: String = ""
    var remindSound: String = ""
    
    var repeatingDays: Set<String> = []
    
    var wakeupTime: Date = Date()
    var bedtime: Date = Date()
    

    var remindAlarm: Bool = false
    var wakeupAlarm : Bool = false

    
    
    var remindAdavance: TimeInterval = 30
    var snooze: TimeInterval = 30
    var smartAlarm: TimeInterval = 30
}

enum FormStep: Int, CaseIterable {
    case one
    case two
    case three
    case four
    
    // Method to get the next step
    func next() -> FormStep? {
        let allCases = FormStep.allCases
        let nextIndex = allCases.firstIndex(of: self)?.advanced(by: 1)
        return nextIndex != nil && nextIndex! < allCases.count ? allCases[nextIndex!] : nil
    }
    
    // Method to get the previous step
    func previous() -> FormStep? {
        let allCases = FormStep.allCases
        let previousIndex = allCases.firstIndex(of: self)?.advanced(by: -1)
        return previousIndex != nil && previousIndex! >= 0 ? allCases[previousIndex!] : nil
    }
    
    // Label for the step
    var label: String {
        switch self {
        case .one: return "Step 1: Personal Information"
        case .two: return "Step 2: Address"
        case .three: return "Step 3: Contact Details"
        case .four: return "Step 4: Preferences"
        }
    }
}



struct AddSleepScheduleView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var progress: Double = 0.25
    @State private var currentStep: FormStep = .one
    
    @State private var addSleep = AddSleep()
    
    var body: some View {
        
        ZStack {
            Color.darkPurple
            
            VStack(spacing: 30) {

                LinearProgressDemoView(progress: progress)
                    .padding(.top, 100)

                VStack {
                    switch currentStep {
                               case .one:
                        StepOneView(addSleep: $addSleep)
                               case .two:
                        StepTwoView(addSleep: $addSleep)
                               case .three:
                        StepThreeView(addSleep: $addSleep)
                               case .four:
                        StepFourView(addSleep: $addSleep)
                          
                               }
                }
                .foregroundStyle(.white)
                
                Spacer()
                HStack {
                    if let previousStep = currentStep.previous() {
                        Button(action: {
                            withAnimation{
                                currentStep = previousStep
                                progress -= 0.25
                            }
                        }) {
                            Text("Previous")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background{
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.lightPurple,lineWidth: 2)
                                }
                                .foregroundStyle(Color.lightPurple)
                        }
                    }
                    
                    
                    if let nextStep = currentStep.next() {
                        Button(action: {
                            withAnimation {
                                currentStep = nextStep
                                progress += 0.25
                            }
                        
                        }) {
                            Text("Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.lightPurple)
                                .foregroundStyle(Color.darkPurple)
                                .cornerRadius(8)
                        }
                    } else {
                        Button(action: {
                            print(addSleep.repeatingDays)
                            let sleep = Sleep(name: addSleep.name, wakeupTime: addSleep.wakeupTime, bedtime: addSleep.bedtime, snooze: addSleep.snooze, remindSound: addSleep.remindSound, remindAdavance: addSleep.remindAdavance, repeatingDays: addSleep.repeatingDays)
                            
                            context.insert(sleep)
                            
                            do {
                                try context.save()
                                dismiss()

                                print("done")
                            } catch {
                                print(error.localizedDescription)
                            }
                            
                            
                        }) {
                            Text("Save")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.lightPurple)
                                .foregroundStyle(Color.darkPurple)
                                .cornerRadius(8)
                        }
                    }
                }
                
            }.padding()
                .padding(.bottom, 20)
            
        }
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("New Schedules").foregroundStyle(.white)
            }

            ToolbarItem(placement: .topBarLeading) {
                  BackButtonview()
            }

        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        .safeAreaPadding(.top, 100)
        .toolbar(.hidden, for: .tabBar)
    }
    
}


struct StepOneView: View {
    
    @Binding var addSleep: AddSleep
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Good night's sleep should be as unique as you are. Tailor your sleep experience in just a few easy steps.").font(.subheadline)
            
                Text("SCHEDULE NAME")
                    .fontWeight(.semibold)
            TextField("Enter name", text: $addSleep.name)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .tint(.white)
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 8).fill(Color.cardPurple)
                    }
                
            
        }
    }
}

struct StepTwoView: View {
//    init() {
//        UIDatePicker.appearance().backgroundColor = UIColor.init(Color.clear) // changes bg color
//            UIDatePicker.appearance().tintColor = UIColor.init(.white) // changes font color
//    }
    
    @State var selectedDate: Date = Date()

    @Binding var addSleep: AddSleep

    let days: [String] = ["Mo", "Tu", "Wd", "Th", "Fr", "Sa", "Su"]
    

    
    private func toggleSelection(for day: String) {
        if addSleep.repeatingDays.contains(day) {
            addSleep.repeatingDays.remove(day)
          } else {
              addSleep.repeatingDays.insert(day)
          }
      }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("DAYS OF THE WEEK")
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("Sleep schedule will be active on these days")
            
            HStack {
                ForEach(days, id: \.self) { day in
                    HStack {
                        Text(day)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(addSleep.repeatingDays.contains(day) ? Color.darkPurple : Color.lightPurple)
                            .lineLimit(0)
                            .frame(width: 45, height: 45)
                    }
                    .background {
                        Circle()
                            .fill(addSleep.repeatingDays.contains(day) ? Color.lightPurple : Color.darkPurple)
                                                        .stroke(Color.lightPurple, lineWidth: 2)
                    }
                    .onTapGesture {
                        withAnimation{
                            toggleSelection(for: day)
                        }
                    }
                    
                }
                
            }
            
            ClockView()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding()
            HStack {
                
            
            HStack{
                VStack {
                    Text("Bed time")
                    DatePicker("Bedtime", selection: $addSleep.bedtime, displayedComponents: .hourAndMinute)
                        .foregroundStyle(Color.white)
                        .labelsHidden()
                        .accentColor(Color.lightPurple)
                }
                Spacer()
                
             
             
            }  .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 8).fill(Color.cardPurple)
                    }

                HStack{
                    VStack {
                        Text("Wake up time")
                        DatePicker("Bedtime", selection: $addSleep.wakeupTime, displayedComponents: .hourAndMinute)
                            .foregroundStyle(.white)
                            .background(Color.cardPurple)
                            .labelsHidden()
                    }
                    Spacer()

                 
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 8).fill(Color.cardPurple)
                }
                    

            }

          
               
        }
    }
}


struct StepThreeView: View {

    @State private var selectedOption: String = "Option 1"
      
    @Binding var addSleep: AddSleep

      let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

    let intervals: [TimeInterval] = [5, 10, 15, 20, 25, 30] //

    var body: some View {
        VStack(alignment: .leading) {
            Text("ALARM SETTINGS")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Form {
                Section() {
                    Toggle(isOn: $addSleep.wakeupAlarm){
                        VStack(alignment: .leading, spacing: 4){
                            Text("Wake up Alarm")
                            Text("Only works after starting tracking")
                                .font(.caption)
                        }
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.lightPurple)) // Change track color
                    .listRowBackground(Color.cardPurple)
                }
                
                Section{
                    Picker("Ringtone", selection: $addSleep.alarmSound) {
                                    ForEach(options, id: \.self) { option in
                                            Text(option)
                                        
                                    }
                                }
                    
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                    .listSectionSeparator(.hidden)
                    
                    Picker("Smart Alarm", selection: $addSleep.smartAlarm) {
                                    ForEach(intervals, id: \.self) { option in
                                        Text("\(Int(option)) minutes") // Convert seconds to minutes
                                            .foregroundColor(.white)
                                    }
                                }
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                    .listSectionSeparator(.hidden)
                    
                    Picker("Snooze", selection: $addSleep.snooze) {
                                    ForEach(intervals, id: \.self) { option in
                                            Text("\(Int(option)) minutes")
                                        
                                    }
                                }
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                    .listSectionSeparator(.hidden)

                    Toggle(isOn: $addSleep.wakeupAlarm){
                        VStack(alignment: .leading, spacing: 4){
                            Text("Fade in")
                            Text("The soiund will get louder gradually")
                                .font(.caption)
                        }
                    }
                    .disabled(true)
                    .toggleStyle(SwitchToggleStyle(tint: Color.lightPurple)) // Change track color
                    .listRowBackground(Color.cardPurple)
                }
            }
            .padding(.horizontal, -20) // Reduce overall horizontal padding in the form
            .scrollContentBackground(.hidden)
//            .background(Color.darkPurple)
        }
    }
}


struct StepFourView: View {

    @State private var selectedOption: String = "Option 1"
      
    @Binding var addSleep: AddSleep

    let intervals: [TimeInterval] = [5, 10, 15, 20, 25, 30]

      let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("SLEEP REMINDER")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.white)
            Form {
                Section() {
                    Toggle(isOn: $addSleep.remindAlarm){
                        VStack(alignment: .leading, spacing: 4){
                            Text("Turn on sleep reminder")
                            Text("Push notification that it's time to sleep")
                                .font(.caption)
                        }
                    }
                    .toggleStyle(SwitchToggleStyle(tint: Color.lightPurple)) // Change track color
                    .listRowBackground(Color.cardPurple)
                }
                
                Section{
                    Picker("Sound", selection: $addSleep.remindSound) {
                                    ForEach(options, id: \.self) { option in
                                            Text(option)
                                        
                                    }
                                }
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                    .listSectionSeparator(.hidden)
                    Picker("Remind in advance", selection: $addSleep.remindAdavance) {
                                    ForEach(intervals, id: \.self) { option in
                                        Text("\(Int(option)) minutes")
                                            .foregroundStyle(.white)
                                        
                                    }
                                }
                    .pickerStyle(.navigationLink)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.cardPurple)
                    .listSectionSeparator(.hidden)
                    .listStyle(.automatic)
                    
                    

                }
            }
            .padding(.horizontal, -20) // Reduce overall horizontal padding in the form
            .scrollContentBackground(.hidden)
//            .background(Color.darkPurple)
        }
    }
}


struct LinearProgressDemoView: View {
     let progress : Double


    var body: some View {
        VStack {
            ProgressView(value: progress)
                .foregroundStyle(Color.lightPurple)
        }
    }
}

#Preview {
    NavigationStack {
        AddSleepScheduleView()
//            .modelContainer(for: [Sleep.self])
    }
}
