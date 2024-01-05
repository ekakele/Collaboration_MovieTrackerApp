//
//  Collaboration_MovieTrackerAppApp.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

@main
struct Collaboration_MovieTrackerAppApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : AppColor.textSecondary]
    }
    
    var body: some Scene {
        WindowGroup {
            MovieTrackerTabView()
        }
    }
}
