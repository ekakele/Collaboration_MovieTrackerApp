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
    @State private var id: Int?
    
    var body: some View {
        ZStack{
            fullInfoStackView
        }
        .padding(.vertical, 5)
        .background(AppColor.background)
    }
    
    
    private var fullInfoStackView: some View {
        VStack(alignment: .leading){
            headlineView
            listView
        }
        .listStyle(.plain)
    }
    
    private var headlineView: some View {
        HStack(spacing: 8) {
            Rectangle()
                .frame(width: 4, height: 32)
                .foregroundColor(AppColor.primaryGreen)
                .cornerRadius(2)
            
            Text("Popular TV series")
                .font(.title2)
                .bold()
                .foregroundStyle(AppColor.textPrimary)
        }
        .padding(.horizontal, 16)
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
                showingDetails.toggle()
                id = tvShow.id
            }
            .sheet(isPresented: $showingDetails) {
                PopularTVSeriesDetailsView(id: id ?? 0)
            }
        }
    }
}


#Preview {
    PopularTVSeriesView()
}
