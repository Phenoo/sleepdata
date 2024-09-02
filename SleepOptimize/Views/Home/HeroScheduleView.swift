//
//  HeroScheduleView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct HeroScheduleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("My Schedule")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
                NavigationLink(destination: Text("Edit"), label: {
                    HStack {
                        Text("Edit")
                            .font(.callout)
                            .fontWeight(.medium)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                    .foregroundStyle(Color.lightPurple)
                })
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    HStack{
                        Text("Bedtime")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "moon.stars.fill")
                            .font(.headline)
                            .padding(5)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            .background(.black).foregroundStyle(.white)
                    }
                    
                    Text("11:00 PM")
                        .font(.headline)
                    
                    Text("in 12h 30min")
                        .font(.subheadline)
                        .padding(.top, 12)
                    
                    
                }.padding()
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10).fill(Color.cardPurple)
                    }
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack{
                        Text("Wake up")
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "alarm.fill")
                            .font(.headline)
                            .padding(5)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            .background(.black).foregroundStyle(.white)
                    }
                    
                    Text("07:00 AM")
                        .font(.headline)
                    
                    
                    Text("tomorrow")
                        .font(.subheadline)
                        .padding(.top, 12)
                    
                }.padding()
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 10).fill(Color.cardPurple)
                    }
            }
            NavigationLink(destination: SleepView()) {
                Text("Start sleep")
                    .fontWeight(.semibold)
                                       .frame(maxWidth: .infinity)
                                       .foregroundStyle(Color.darkPurple)
                                       .padding()
                                       .background(Color.lightPurple)
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
        }
    }
}

#Preview {
    HeroScheduleView()
}
