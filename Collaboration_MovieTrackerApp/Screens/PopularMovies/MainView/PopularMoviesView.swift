//
//  PopularMoviesView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel = PopularMoviesViewModel()
    @State private var isShowingDetails = false
    @State private var selectedMovie: Movie?


    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()
            VStack(alignment: .leading){
                MainTitleView()
                listView
            }
        }
        .sheet(isPresented: $isShowingDetails) {
            if let movie = selectedMovie {
                PopularMoviesDetailsView(movie: movie)
            }
        }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                ListRowView(image: viewModel.generateImageURL(for: movie.image),
                            title: movie.title,
                            shortInfo: movie.shortInfo,
                            genre: movie.genre.first?.rawValue ?? "",
                            imdb: "IMDB",
                            imdbRating: String(format: "%.1f", movie.imdbRating)
                )
                .onTapGesture {
                                  selectedMovie = movie
                                  isShowingDetails = true
                              }
            }
            .listRowBackground(Color.clear)
        }
        .padding(.vertical, 5)
        .listStyle(PlainListStyle())
        
    }
    
    private var listTitleView: some View {
            Text("Popular Persons")
                .font(.title)
                .bold()
                .foregroundStyle(AppColor.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
        }
    
}

#Preview {
    PopularMoviesView()
}
