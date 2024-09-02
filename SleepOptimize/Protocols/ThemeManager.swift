//
//  ThemeProtocolManager.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 20/08/2024.
//

import Foundation
import SwiftUI
/**
 Theme Manager
 */
class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = Main()
    
    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
