//
//  MovieTrackerTabView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MovieTrackerTabView: View {
    
    //MARK: Body
    var body: some View {
        TabView {
            createTabItem(view: PopularMoviesView(), systemName: "movieclapper", text: "Movies")
            createTabItem(view: PopularPersonsView(), systemName: "person", text: "Persons")
            createTabItem(view: PopularTVSeriesView(), systemName: "play.tv", text: "TV Series")
            createTabItem(view: MoviesInCinemaView(), systemName: "popcorn", text: "In Cinema")
            createTabItem(view: TVSeriesOnAirView(), systemName: "appletv", text: "On Air")
        }
        .accentColor(AppColor.primaryGreen)
    }
    
    //MARK: Components
    private func createTabItem<T: View>(view: T, systemName: String, text: String) -> some View {
        view
            .tabItem {
                Image(systemName: systemName)
                Text(text)
            }
    }
}

#Preview {
    MovieTrackerTabView()
}
