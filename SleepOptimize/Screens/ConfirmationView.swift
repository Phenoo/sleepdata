//
//  ConfirmationView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 24/08/2024.
//

import SwiftUI

struct ConfirmationView: View {
    let numbers: [Int] = Array(1...100)
       // State to track the current index and timer
       @State private var currentIndex: Int = 0
       @State private var timer: Timer?
    @State private var shouldNavigate = false  // State to trigger navigation

    @AppStorage("hasOnboarding") var hasOnboarding = false


    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkPurple
            VStack {
                VStack{
                    Spacer()
                    ProgressCardView(progress: $currentIndex, goal: 100, color: Color.lightPurple)
                        .frame(width: 100)
                        .padding()
                    Text("Personalizing your experience")
                    Spacer()
                    Text("Sleep is the golden chanrge that ties health and organs of the body together")
                        .font(.headline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    Spacer()

                }.foregroundStyle(.white)
                    .padding()
                .onAppear{
                    startSequence()
                }
                
              
                NavigationLink(
                    destination: ContentView().navigationBarBackButtonHidden(),  // Replace with your target view
                                    isActive: $shouldNavigate
                                ) {
                                    EmptyView()
                                }
            }
        }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
    private func startSequence() {
        // Invalidate the existing timer if any
        timer?.invalidate()
        
        // Reset the index to 0
        currentIndex = 0
        
        // Start a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            // Move to the next number
            if currentIndex < numbers.count - 1 {
                currentIndex += 1
                if currentIndex == 99 {
                    hasOnboarding = true
                    shouldNavigate = true

                              }
            } else {
                timer?.invalidate()
            }
        }
    }
}

#Preview {
    ConfirmationView()
}
