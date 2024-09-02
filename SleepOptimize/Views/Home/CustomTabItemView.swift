//
//  CustomTabItemView.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import SwiftUI

struct CustomTabItemView: View {
    let image: String
    let name: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: image)
                .font(.title2)
            Text(name)
                .font(.subheadline)
        }
    }
}

