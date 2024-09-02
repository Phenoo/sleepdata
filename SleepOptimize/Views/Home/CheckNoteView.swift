//
//  CheckNoteView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct CheckNoteView: View {
    let note: Note

    var body: some View {
        ZStack {
            Color.cardPurple
            VStack(spacing: 20) {
                Image(systemName: note.icon)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 5).fill(Color.darkPurple)
                    }
                
                Text(note.name)
                    .font(.headline)
                    .fontWeight(.medium)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(note.desc)
                        .font(.subheadline)
                    
                    
                    Text(note.tag)
                    
                    Text("Practical tips for minimizing noise:")
                    
                    
                }
            }
            .foregroundStyle(.white)
            .padding()
        }
        .ignoresSafeArea()
    }
}

