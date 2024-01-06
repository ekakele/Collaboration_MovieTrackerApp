//
//  PopularTVSeriesView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI
import GenericNetworkManager

struct PopularTVSeriesView: View {
    @StateObject var viewModel = PopularTVSeriesViewModel()
    
    var body: some View {
        VStack{
            List(viewModel.tvShows, id: \.id) { tvShow in
                ListRowView(
                    image: viewModel.generateImageURL(for: tvShow.posterPath) ?? "defaultImage" ,
                    title: tvShow.name,
                    shortInfo: tvShow.overview,
                    genre: Genre.genreString(for: tvShow.genreIds.first ?? 0),
                    imdb: "IMDB",
                    imdbRating: String(tvShow.voteAverage)
                )
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    PopularTVSeriesView()
}
