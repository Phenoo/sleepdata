//
//  SleepOptimizeApp.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI
import SwiftData

@main
struct SleepOptimizeApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .accentColor(Color.lightPurple)
                    .background(Color.darkPurple)
                    .preferredColorScheme(.dark)
            }
        }.modelContainer(for: [Sleep.self])
    }
}
