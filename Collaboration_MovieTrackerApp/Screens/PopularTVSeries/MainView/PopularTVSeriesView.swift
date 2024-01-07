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
    @State private var showingDetails = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                
                Text("Popular TV Series")
                    .font(.title)
                    .bold()
                    .foregroundStyle(AppColor.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                List(viewModel.tvShows, id: \.id) { tvShow in
                    ListRowView(
                        image: viewModel.generateImageURL(for: tvShow.posterPath),
                        title: tvShow.name,
                        shortInfo: tvShow.overview,
                        genre: Genre.genreString(for: tvShow.genreIds.first ?? 0),
                        imdb: "IMDB",
                        imdbRating: String(format: "%.1f",tvShow.voteAverage)
                    )
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        showingDetails.toggle()
                    }
                    .sheet(isPresented: $showingDetails) {
                        PopularTVSeriesDetailsView()
                    }
                }
                .listStyle(.plain)
            }
            .padding(.vertical, 5)
        }
        .background(AppColor.background)
    }
}

#Preview {
    PopularTVSeriesView()
}
