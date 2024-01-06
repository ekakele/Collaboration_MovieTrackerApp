//
//  PopularMoviesView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel = PopularMoviesViewModel()

    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            
            listView
        }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                ListRowView(image: viewModel.generateImageURL(for: movie.image)!,
                            title: movie.title,
                            shortInfo: movie.shortInfo,
                            genre: movie.genre.first?.rawValue ?? "",
                            imdb: "IMDB",
                            imdbRating: String(movie.imdbRating)
                )
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    PopularMoviesView()
}
