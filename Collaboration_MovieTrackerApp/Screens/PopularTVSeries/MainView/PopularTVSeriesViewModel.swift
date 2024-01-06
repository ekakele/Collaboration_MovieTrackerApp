//
//  PopularTVSeriesViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

class PopularTVSeriesViewModel: ObservableObject {
    
    @Published var tvShows: [TVShow] = []
    private var networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org")
    
    init() {
        fetchTVShows()
    }

    
    func fetchTVShows() {
        networkManager.fetchData(endpoint: "/3/tv/popular?api_key=fc0c012be098a15452a64aa9c7fa252b") { (result: Result<TVShowList, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.tvShows = response.results
                }
            case .failure(let error):
                print("Failed to fetch TV shows: \(error)")
            }
        }
    }
    
    func  generateImageURL(for profilePath: String?) -> String? {
        guard let profilePath = profilePath else { return nil }
        
        let baseImageURL = "https://image.tmdb.org/t/p/"
        let imageSize = "original"
        
        return baseImageURL + imageSize + profilePath
    }
}

