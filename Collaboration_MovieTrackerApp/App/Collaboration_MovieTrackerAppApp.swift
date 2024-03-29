//
//  Collaboration_MovieTrackerAppApp.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

@main
struct Collaboration_MovieTrackerAppApp: App {
    
    //MARK: Init
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : AppColor.textSecondary]
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
    
    //MARK: Body
    var body: some Scene {
        WindowGroup {
            MovieTrackerTabView()
        }
    }
}
