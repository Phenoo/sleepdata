//
//  SleepSchedulesView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 21/08/2024.
//

import SwiftUI
import SwiftData

struct SleepSchedulesView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Query(sort: \Sleep.name, order: .forward) private var sleeps : [Sleep]
    
    var body: some View {
            ZStack {
                Color.darkPurple
                if sleeps.isEmpty {
                    VStack(alignment: .center, spacing: 40) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 100))
                            .foregroundStyle(Color.lightPurple)
                            .symbolEffect(.bounce.down, value: true)

                        VStack {
                            Text("No schedules")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("To add your new schedule")
                                .font(.subheadline)
                            Text("Tap on button")
                                .font(.subheadline)

                        }
                    }
                    .background(Color.darkPurple)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

                }
                else {

                List {
                        ForEach(sleeps) { sleepItem in
                            SleepCardView(sleep: sleepItem)
                                .listRowBackground(Color.darkPurple)
                                .listRowSeparator(.hidden)
                    }
                    }
                    
                .listStyle(.inset)
                .scrollIndicators(.hidden)
                .scrollContentBackground(.hidden)
                .background(Color.darkPurple) // Ensure background color for the List
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)
                .scrollIndicators(.hidden)
                }
               
                
            }
            .background(Color.darkPurple)

            
            .navigationTitle("Sleep Schedules")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbarBackground(.visible, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Sleep Schedules").foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddSleepScheduleView()) {
                        HStack {
                            Text("Add")
                            Image(systemName: "plus")
                                .font(.subheadline)
                        }.foregroundStyle(Color.lightPurple)

                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                      BackButtonview()
                }
            }
    }
}



#Preview {
        SleepSchedulesView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    
}
