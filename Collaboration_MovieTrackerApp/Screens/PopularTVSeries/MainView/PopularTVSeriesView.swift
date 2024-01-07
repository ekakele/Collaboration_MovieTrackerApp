//
//  PopularTVSeriesView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI
import GenericNetworkManager

struct PopularTVSeriesView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = PopularTVSeriesViewModel()
    @State private var showDetailsPage: [Int: Bool] = [:]
    
    //MARK: - Body
    var body: some View {
        ZStack{
            fullInfoStackView
        }
        .padding(.vertical, 5)
        .background(AppColor.background)
    }
    
    //MARK: - Components
    private var fullInfoStackView: some View {
        VStack(alignment: .leading){
            MainTitleView(title: "Popular TV series")
            listView
        }
        .listStyle(.plain)
    }
    
    private var listView: some View {
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
                showDetailsPage[tvShow.id, default: false].toggle()
            }
            .sheet(isPresented: Binding(
                get: { showDetailsPage[tvShow.id, default: false] },
                set: { showDetailsPage[tvShow.id] = $0 }
            )) {
                PopularTVSeriesDetailsView(id: tvShow.id)
                    .presentationDetents([.fraction(0.99)])
            }
        }
    }
}



#Preview {
    PopularTVSeriesView()
}
