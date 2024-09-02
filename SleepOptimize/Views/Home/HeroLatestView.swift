//
//  HeroLatestView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct HeroLatestView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Latest Report")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
                NavigationLink(destination: Text("Edit"), label: {
                    HStack {
                        Text("Details")
                            .font(.callout)
                            .fontWeight(.medium)
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                    .foregroundStyle(Color.lightPurple)
                })
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("April 25, Tuesday")
                    .font(.caption)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                Text("You were asleep for 5h 45min (01:45 AM - 07.00 AM")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .foregroundStyle(.white)
            .background(Color.cardPurple)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
         WellnessCoach()
            
         
        }
    }
}

#Preview {
    HeroLatestView()
}
