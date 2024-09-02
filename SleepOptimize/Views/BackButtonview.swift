//
//  BackButtonview.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 21/08/2024.
//

import SwiftUI

struct BackButtonview: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .font(.subheadline)
            Text("Back")
        }
        .foregroundStyle(Color.lightPurple)
        .onTapGesture {
            dismiss()
        }

    }
}

#Preview {
    BackButtonview()
}
