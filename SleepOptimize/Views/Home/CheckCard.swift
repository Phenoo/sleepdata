//
//  CheckCard.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct CheckCard: View {
   
    let note: Note

    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: note.icon)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 5).fill(Color.darkPurple)
                }
                  
                Spacer()
             
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(Color.white.opacity(0.5))
                   


            }
            
            Text(note.name)
                .font(.caption)
                .padding(.top, 26)
                .foregroundStyle(Color.white.opacity(0.5))
            Text(note.tag)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .padding(.top, 2)
            
        }
        .frame(height: 120)
        .padding()
        .background(Color.cardPurple).clipShape(RoundedRectangle(cornerRadius: 10))
       
    }
}

#Preview {
    HeroCheckView()
}
