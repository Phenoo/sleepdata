//
//  SleepView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct SleepView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPulsing = false
    
    @State private var stopTracking: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            Color.darkPurple
            
        VStack {
            Image("mountain")
                .resizable()
                .scaledToFill()
            SleepTrackView()
                .background(Color.darkPurple.opacity(0.8))
                .offset(y: -150)

            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack {
                        Image(systemName: "chevron.up") // Use any SF Symbol you prefer
                            .font(.system(size: 30)) // Adjust the size as needed
                            .foregroundStyle(.opacity(0.5))
                            .scaleEffect(isPulsing ? 1.2 : 1.0) // Scale up to 1.2x its size
                            .animation(
                                Animation.easeInOut(duration: 0.8)
                                    .repeatForever(autoreverses: true)
                            )
                            .onAppear {
                                self.isPulsing = true
                            }
                        Image(systemName: "chevron.up")
                            .font(.system(size: 30)) // Adjust the size as needed
                        Image(systemName: "sun.haze.fill")
                            .font(.title)
                            .padding(8)
                        Text("Swipe up to stop tracking")
                            .padding(8)
                    }
                    .foregroundStyle(.gray)
                    .padding(.bottom, 60)
                })
                .padding(.bottom, 60)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { value in
                            if value.translation.height < 0 {
                                // Detected a swipe up gesture
                                stopTracking = true
                            }
                        }
                )
            }
        }
            .sheet(isPresented: $stopTracking) {
                ZStack {
                    Color.cardPurple
                    VStack(spacing: 10) {
                        Text("Stop Tracking")
                            .fontWeight(.semibold)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("The sleep timer can apply similar techniques to other properties like scalin different types of infinite animations.")
                            
                            Text("Are you sure you want tot stop?")
                                .padding(.bottom, 20)
                        }
                        
                        VStack(spacing: 16) {
                            Button(action: {
                                stopTracking = false
                            }, label: {
                                Text("Keep Tracking")
                                    .padding()
                                    .foregroundStyle(Color.darkPurple)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                            }).background(Color.lightPurple)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            Button(action: {
                                stopTracking = false
                                dismiss()
                            }, label: {
                                Text("Quit now")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(Color.lightPurple)
                            })
                            .background {
                                RoundedRectangle(cornerRadius: 10).stroke(Color.lightPurple,lineWidth: 2)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                }
                .ignoresSafeArea()
                .presentationDetents([.fraction(0.4)])
            }
    }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}


struct SleepTrackView: View {
    var body: some View {
        ZStack {
            VStack{
                VStack {
                    Text("03: 38")
                        .font(.system(size: 60))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Thursday, April 26")
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Label("6:30 - 7:00", systemImage: "alarm.fill")
                            .padding()
                            .padding(.horizontal)
                            .foregroundStyle(.black)
                    }).background(Color.lightPurple).clipShape(Capsule()).padding()
                }.foregroundStyle(.white)
                
                VStack(spacing: 30) {
                HStack {
                    HStack {
                        Image("warm")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Warm Sunrise")
                            Text("Music")
                        }
                    }.foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Image(systemName: "play.fill")
                        Image(systemName: "music.note.list")
                    }
                    .font(.title2)
                    .foregroundStyle(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 15).fill(Color.cardPurple)
                }
                
                HStack {
                    VStack {
                        Text("5h 38min")
                        Text("Duration")
                            .font(.caption)
                    }.foregroundStyle(Color.lightPurple)
                    Spacer()
                    Divider()
                        .frame(width: 1, height: 40)
                        .overlay(Color.lightPurple)
                    Spacer()
                    
                    VStack {
                        Text("5h 38min")
                        Text("Till alarm")
                            .font(.caption)
                    }.foregroundStyle(Color.lightPurple)
                    Spacer()
                    
                    Divider()
                        .frame(width: 1, height: 40)
                        .overlay(Color.lightPurple)
                    Spacer()
                    VStack {
                        Text("5h 38min")
                        Text("Noise level")
                            .font(.caption)
                    }.foregroundStyle(Color.lightPurple)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background {
                    RoundedRectangle(cornerRadius: 15).fill(Color.cardPurple)
                }
            }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

#Preview {
    SleepView()
}
