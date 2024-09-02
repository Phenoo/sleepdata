//
//  AddSleepJournalView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct AddSleepJournalView: View {
    @State private var selectedDate: Date = Date()
    @State private var selectedEmoji: String = ""
    @State private var searchText: String = ""

    
    private let emojis = [
             "😅", "😂", "😊",
            "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "😋",
            "😎", "😟", "😤", "😢", "😭", "😱", "😨",
        ]
    
    var filteredEmojis: [String] {
           if searchText.isEmpty {
               return emojis
           } else {
               return emojis.filter { $0.contains(searchText) }
           }
       }
    
    var body: some View {
        NavigationStack {
            Form{
                Section("WENT TO BED"){
                    HStack {
                        Text("Date")
                        Spacer()
                        DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                            .foregroundStyle(Color.white)
                            .labelsHidden()
                            .accentColor(Color.darkPurple)
                    }
                    
                    HStack {
                        Text("Time")
                        Spacer()
                        DatePicker("Date", selection: $selectedDate, displayedComponents: .hourAndMinute)
                            .foregroundStyle(Color.white)
                            .labelsHidden()
                            .accentColor(Color.darkPurple)
                            .font(.title3)
                    }
                }
                .font(.headline)
                .listRowBackground(Color.cardPurple)

                
                Section("WAKE UP") {
                    DatePicker(selection: $selectedDate, displayedComponents: .date, label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Date")
                        }
                    })
                    
                    DatePicker(selection: $selectedDate, displayedComponents: .hourAndMinute, label: {
                        HStack {
                            Image(systemName: "clock.fill")
                            Text("Time")
                        }
                    })
                    
                    
                    HStack {
                        
                        Picker(selection: $selectedEmoji, content: {
                            ForEach(emojis, id: \.self) { emoji in
                                Text(emoji)
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "face.smiling")
                                Text("Mood")
                            }
                        })
                        .foregroundStyle(.white)
                        .tint(.white)
                    }
                    
                }
                .listRowBackground(Color.cardPurple)
                .font(.headline)
                
                
            }
            .foregroundStyle(.white)
            .navigationTitle("Add sleep data")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .scrollContentBackground(.hidden)
            .background(Color.darkPurple)
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Save")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.lightPurple)
                }
                ToolbarItem(placement: .topBarLeading) {
                    BackButtonview()
                }
            }
        }
    }
}

#Preview {
    AddSleepJournalView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
