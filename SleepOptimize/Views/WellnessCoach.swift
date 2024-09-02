//
//  WellnessCoach.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct WellnessCoach: View {

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 12){
                    Text("Wellness Coach")
                        .font(.headline)
                    Text("Your sleep quality has slightly decreased this week. Wanna talk about this?")
                        .font(.caption)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Chat with coach")
                            .font(.subheadline)
                            .padding()
                            .fontWeight(.semibold)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    })
                    .foregroundStyle(Color.lightPurple).background {
                        RoundedRectangle(cornerRadius: 20).stroke(Color.lightPurple,lineWidth: 2)
                    }
                }.frame(width: 200)
                Spacer()
                SleepQualityView()
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(Color.cardPurple)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WellnessCoach()
}
