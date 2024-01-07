//
//  MoviesInCinemaView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct MoviesInCinemaView: View {
    
    @StateObject private var viewModel = MoviesInCinemaViewModel()
    @State private var isMovieDetailViewActive = false
    @State private var showDetailsPage: [Int: Bool] = [:]
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColor.background.ignoresSafeArea(.all)
                listView
            }
        }
    }
    
    private var listView: some View {

            VStack(alignment: .leading) {
                
//                headerTitleView
                ScrollView {
                
                VStack(spacing: 12) {
                    ForEach(viewModel.results, id: \.id) { movie in
                        
                        Button(action: {
                            showDetailsPage[movie.id, default: false].toggle()
                        }, label: {
                            ListRowView(
                                image: viewModel.generateImageURL(for: movie.posterPath),
                                title: movie.title,
                                shortInfo: movie.shortInfo,
                                genre: movie.genreIds.first?.rawValue ?? "",
                                imdb: "IMDB",
                                imdbRating: String(format: "%.1f", movie.imdbRating)
                            )
                        })
                        .sheet(isPresented: Binding(
                            get: { showDetailsPage[movie.id, default: false] },
                            set: { showDetailsPage[movie.id] = $0 }
                        )) {
                            MoviesInCinemaDetailsView(movieID: movie.id)
                                .presentationDetents([.fraction(0.98)])
                        }
                        
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    MoviesInCinemaView()
}

