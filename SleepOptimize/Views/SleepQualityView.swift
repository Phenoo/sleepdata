//
//  SleepQualityView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 23/08/2024.
//

import SwiftUI

struct SleepQualityView: View {
    @State private var progress: Int = 72

    var body: some View {
        VStack(spacing: 15) {
            Text("Sleep Quality")
                .font(.headline)
                .fontWeight(.semibold)
            
            ProgressCardView(progress: $progress, goal: 100, color: Color.lightPurple)
                .frame(width: 100)
                .padding(4)
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

#Preview {
    SleepQualityView()
}
