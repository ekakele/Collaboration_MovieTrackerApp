//
//  AppColorExtension.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct AppColor {
    static let background = Color(hex: 0x202020)
    static let darkGray = Color(hex: 0x252525)
    static let lightGray = Color(hex: 0x2C2C2C)
    static let textPrimary = Color(hex: 0xE1E1E1)
    static let textSecondary = Color(hex: 0x7F7F7F)
    static let primaryOrange = Color(hex: 0xD4E80D)
}
 
extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255.0
        let green = Double((hex >> 8) & 0xFF) / 255.0
        let blue = Double(hex & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
