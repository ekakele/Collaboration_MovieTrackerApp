//
//  PopularMoviesDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularMoviesDetailsView: View {
    //MARK: - Properties
    @StateObject var viewModel: PopularMoviesDetailsViewModel
    
    //MARK: - Init
    init(movie: Movie) {
        self._viewModel = StateObject(wrappedValue: PopularMoviesDetailsViewModel(movie: movie))
    }
    
    //MARK: - Body
    var body: some View {
        ZStack() {
            DetailsVStackView
                .onAppear(perform: {
                    viewModel.fetchData()
                })
        }
    }
    
    var DetailsVStackView: some View {
        VStack {
            DetailsView(
                image: viewModel.generateImageURL(for: viewModel.moviesDetails?.posterPath),
                title: viewModel.moviesDetails?.title ?? "",
                genre: viewModel.moviesDetails?.genres.first?.name ?? "",
                imdb: "IMDB",
                imdbRating: String(format: "%.1f", viewModel.moviesDetails?.voteAverage ?? 0.0),
                shortInfo: viewModel.moviesDetails?.overview ?? "",
                language: viewModel.moviesDetails?.originalLanguage ?? "",
                originCountry: viewModel.moviesDetails?.productionCountries.first?.name ?? "",
                buttonTitle: "Watch",
                languageTitle: "Language"
            )
        }
    }
}

#Preview {
    PopularMoviesDetailsView(movie: Movie(id: 1, image: "vdfa", title: "vdfa", shortInfo: "dcfd", genre: [], imdbRating: 2.0))
}
