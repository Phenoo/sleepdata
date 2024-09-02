//
//  SettingsView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var language: String = ""
    @State private var timezone: String = ""
    @State private var timeformat: String = ""

    @State private var record: Bool = false

    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("GENERAL PREFERENCES") {
                    Picker("Language", selection: $language) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .foregroundStyle(.white)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    Picker("Time zone", selection: $language) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                                .foregroundStyle(.white)
                        }
                    }.pickerStyle(.navigationLink)
                    
                    Picker("Time format", selection: $language) {
                        Text("12 hour")
                        Text("24 hour")
                        
                        
                    }
                    .foregroundStyle(.white)
                    .pickerStyle(.navigationLink)
                }
                .listRowBackground(Color.cardPurple)
                .foregroundStyle(.white)

                
                Section("SLEEP TRACKING") {
                    Toggle(isOn: $record) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Record sounds & noise")
                            Text("Capture sleep sounds anf ambients noise to analyze and improve your sleep quality")
                                .font(.caption)
                                .opacity(0.5)
                        }
                    }.tint(Color.lightPurple)
               
                    Toggle(isOn: $record) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Check before sleep")
                            Text("Capture sleep sounds anf ambients noise to analyze and improve your sleep quality")
                                .font(.caption)
                                .opacity(0.5)
                        }
                    }.tint(Color.lightPurple)
                    
                    Toggle(isOn: $record) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Wake up mood")
                            Text("Capture sleep sounds anf ambients noise to analyze and improve your sleep quality")
                                .font(.caption)
                                .opacity(0.5)
                        }
                    }.tint(Color.lightPurple)
                
                    Toggle(isOn: $record) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Changing & placing reminder")
                            Text("Capture sleep sounds anf ambients noise to analyze and improve your sleep quality")
                                .font(.caption)
                                .opacity(0.5)
                        }
                    }.tint(Color.lightPurple)
                    
                }
                .foregroundStyle(.white)
                .listRowBackground(Color.cardPurple)
                
                Section("ACCOUNT") {
                    Text("Change Passowrd")
                    Text("Delete my account")
                        .foregroundStyle(.red)

                }
                .foregroundStyle(.white)
                .listRowBackground(Color.cardPurple)

            }
            .scrollContentBackground(.hidden)
            .background(Color.darkPurple)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
