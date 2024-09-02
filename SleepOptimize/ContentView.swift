//
//  ContentView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {

    @AppStorage("hasOnboarding") var hasOnboarding = false

    var body: some View {
        if hasOnboarding {
            MainPageView()
        } else {
            OnboardingView()
        }
    }
}

struct MainPageView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.darkPurple)
        UITabBar.appearance().backgroundColor = UIColor(Color.darkPurple)
        UINavigationBar.appearance().barTintColor = UIColor(Color.darkPurple)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    @State private var selectedTag: Int = 1
    @State private var expandSheet: Bool = false
    
    @Namespace var animation
    
    
    var body: some View {
        ZStack {
            Color.darkPurple
            
            TabView(selection: $selectedTag ,
                    content:  {
                HomeView().tabItem { CustomTabItemView(image: "house", name: "Home") }.tag(1)
                SleepHubView().tabItem { CustomTabItemView(image: "sparkles", name: "Sleep Hub") }.tag(2)
                RelaxView().tabItem { CustomTabItemView(image: "leaf.circle", name: "Relax") }.tag(3)
                JournalView().tabItem { CustomTabItemView(image: "chart.bar.xaxis.ascending", name: "Journal") }.tag(4)
                ProfileView().tabItem { CustomTabItemView(image: "person.circle", name: "Profile") }.tag(5).background(Color.darkPurple)
                
                
            })
            .toolbarBackground(Color.darkPurple, for: .navigationBar)
        }.safeAreaInset(edge: .bottom) {
            if selectedTag == 3 {
                CustomSheet(expandSheet: $expandSheet)
                    .onTapGesture {
                        expandSheet = true
                    }
            }
        }
        .overlay {
            if expandSheet {
                MusicView(expandSheet: $expandSheet, animation: animation)
            }
        }

    }
}

struct CustomSheet: View {
    @Namespace var animation
    @Binding var expandSheet: Bool
    
    var body: some View {
        ZStack {
            if expandSheet {
                Rectangle()
                    .fill(.clear)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.cardPurple)
                    .overlay {
                        MusicInfo(animation: animation)
                    }
                    .matchedGeometryEffect(id: "BACKGROUNDVIEW", in: animation)
            }
            
            
        }
        .frame(height: 60)
        .offset(y: -50)
        .padding()
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
