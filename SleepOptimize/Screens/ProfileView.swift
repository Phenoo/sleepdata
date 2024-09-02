//
//  ProfileView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkPurple
                VStack {
                    
                    VStack(spacing: 16) {
                        Image("user")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text("Maria")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("descometusah@gmail.com")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .tint(.white)

                    }
                    
                    VStack {
                        
                        HStack {
                            Spacer()
                            VStack {
                                Text("139")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("Nights")
                                    .font(.caption)
                                    .foregroundStyle(Color.customGray)
                            }.foregroundStyle(Color.lightPurple)
                            Spacer()
                            Divider()
                                .frame(width: 1, height: 40)
                                .overlay(Color.lightPurple)
                            Spacer()
                            
                            VStack {
                                Text("88")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("Quality")
                                    .font(.caption)
                                    .foregroundStyle(Color.customGray)

                            }.foregroundStyle(Color.lightPurple)
                            Spacer()
                            
                            Divider()
                                .frame(width: 1, height: 40)
                                .overlay(Color.lightPurple)
                            Spacer()
                            VStack {
                                Text("5h 38min")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text("Duration")
                                    .font(.caption)
                                    .foregroundStyle(Color.customGray)
                            }.foregroundStyle(Color.lightPurple)
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background {
                            RoundedRectangle(cornerRadius: 15).fill(Color.cardPurple)
                        }
                    }
                    .padding()
                    
                    List {
                        NavigationLink(destination: PersonalView()) {
                            Label("Personal Information", systemImage: "person.crop.circle")
                                .foregroundStyle(.white)
                            
                        }
                        .listRowBackground(Color.cardPurple)
                        
                        
                        NavigationLink(destination: SleepSchedulesView()) {
                            Label("Sleep Schedules", systemImage: "moon.zzz.fill")
                                .foregroundStyle(.white)
                        }
                        .listRowBackground(Color.cardPurple)
                        NavigationLink(destination: SettingsView()) {
                            Label("Settings", systemImage: "gearshape.fill")
                                .foregroundStyle(.white)
                        }
                        .listRowBackground(Color.cardPurple)
                        
                        NavigationLink(destination: Text("Privacy Settings")) {
                            Label("Privacy policy", systemImage: "lock.shield")
                                .foregroundStyle(.white)
                            
                        }
                        .listRowBackground(Color.cardPurple)
                        NavigationLink(destination: Text("Privacy Settings")) {
                            Label("Help & support", systemImage: "questionmark.circle.fill")
                                .foregroundStyle(.white)
                            
                        }
                        .listRowBackground(Color.cardPurple)
                        Label("Logout", systemImage: "lock.shield")
                            .foregroundStyle(.white)
                        
                        
                            .listRowBackground(Color.cardPurple)
                        
                    }
                    .foregroundStyle(.white)
                    .scrollContentBackground(.hidden)
                    .background(Color.darkPurple)
                    
                    
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Profile")
                        .foregroundStyle(.white) // Customize the color of the title
                        .font(.headline)
                }
            }
            .background(Color.darkPurple)
                .foregroundStyle(.white)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ProfileView()
}
