//
//  MoviesInCinemaView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaView: View {
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea(.all)
           
            ScrollView {
                VStack(spacing: 12) {
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                    ListRowView(image: "defaultImage", title: "Title", shortInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", genre: "test", imdb: "IMDB", imdbRating: "4.8")
                }
            }
            
            
        }
    }
}

#Preview {
    MoviesInCinemaView()
}
