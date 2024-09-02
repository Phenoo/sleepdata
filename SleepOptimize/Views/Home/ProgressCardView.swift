//
//  ProgressCardView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//


import SwiftUI

struct ProgressCardView: View {
    @Binding var progress: Int
    var goal: Int
    var color: Color
    private let width: CGFloat = 8
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: width)
        Text("\(progress)%")
                .font(.title3)
                .fontWeight(.medium)
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(progress) / CGFloat(goal))
                .stroke(color, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ProgressCardView(progress: .constant(200), goal: 200, color: .red)
}
