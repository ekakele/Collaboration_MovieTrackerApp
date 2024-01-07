//
//  PopularTVSeriesDetailsView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularTVSeriesDetailsView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = PopularTVSeriesDetailsViewModel()
    @State var id: Int
    
    // MARK: - Body
    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            
            if let TVShow = viewModel.showDetails {
                setupDetailsView(for: TVShow)
            } else {
                Text("Details page is under construction 🛠️")
                    .foregroundStyle(AppColor.textPrimary)
                    .onAppear {
                        viewModel.fetchDetails(id: id)
                    }
            }
        }
    }
    
    // MARK: - Components
    private func setupDetailsView(for TVShow: TVShowDetails) -> some View {
        DetailsView(
            image: viewModel.generateImageURL(for: TVShow.posterPath),
            title: TVShow.name,
            genre: TVShow.genres.first?.name ?? "",
            imdb: "IMDB",
            imdbRating: String(TVShow.voteAverage),
            shortInfo: TVShow.overview,
            language: TVShow.originalLanguage,
            originCountry: TVShow.originCountry.first ?? "",
            buttonTitle: "Watch",
            languageTitle: TVShow.languages.first ?? ""
        )
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PopularTVSeriesDetailsView( id: 12513)
}
