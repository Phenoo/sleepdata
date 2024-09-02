//
//  HeroView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack() {
            ZStack {
                Image("category8")
                    .resizable()
                    .frame(height: 200)
                    .overlay {
                        Rectangle().fill(.black.opacity(0.5))
                    }
                HStack {
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                      
                    VStack(alignment: .leading) {
                        Text("\(Date(), style: .date)")
                            .font(.subheadline)
                        Text("Good Evening, Maria")
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding()
                .padding(.top, 60)
                }
            
        }
    }
}

#Preview {
    HeroView()
}
