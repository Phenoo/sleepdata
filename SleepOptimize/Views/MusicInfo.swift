//
//  MusicInfo.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import SwiftUI

struct MusicInfo: View {
    let animation : Namespace.ID
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .padding(8)
                    .background(Color.lightPurple.opacity(0.5))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading) {
                    Text("Dreamland Witz")
                        .font(.subheadline)
                    Text("15 min - Music")
                        .font(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
                
                HStack(spacing: 20) {
                    Image(systemName: "heart")
                    
                    Image(systemName: "xmark")

                }
                .font(.headline)
            }
            .padding()
            .foregroundStyle(.white)

        }
    }
}

