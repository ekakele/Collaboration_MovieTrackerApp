//
//  MoviesInCinemaView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaView: View {
    
   @StateObject private var viewModel = MoviesInCinemaViewModel()
        
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea(.all)
            listView
        }
    }
    
    private var listView: some View {
        ScrollView {
                VStack(spacing: 12) {
                    
                    ForEach(viewModel.results, id: \.id) { movie in
                        ListRowView(
                            image: viewModel.generateImageURL(for: movie.posterPath)!,
                            title: movie.title,
                            shortInfo: movie.shortInfo,
                            genre: movie.genreIds.first?.rawValue ?? "",
                            imdb: "IMDB",
                            imdbRating: String(format: "%.1f", movie.imdbRating)
                        )
                    }
                }
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    MoviesInCinemaView()
}
