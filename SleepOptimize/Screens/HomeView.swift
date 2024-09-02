//
//  HomeView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ZStack {
                    Color.darkPurple
                    VStack {
                        HeroView()
                        
                        HeroScheduleView()
                            .padding()
                        HeroLatestView()
                            .padding()
                        HeroCheckView()
                        
                        Spacer()
                    }
                }
                .ignoresSafeArea()
                .padding(.bottom, 60)
            }

            .navigationBarBackButtonHidden()
            .background(Color.darkPurple)
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    HomeView()
}
