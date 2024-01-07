//
//  PopularTVSeriesDetailsViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

class PopularTVSeriesDetailsViewModel: ObservableObject {
    
    private var networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org")
    @Published var showDetails: TVShowDetails?
    
    func fetchDetails(id: Int) {
        print(id)
        let endpoint = "/3/tv/\(id)?api_key=fc0c012be098a15452a64aa9c7fa252b"
        
        networkManager.fetchData(endpoint: endpoint) { (result: Result<TVShowDetails, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.showDetails = response
                }
            case .failure(let error):
                print("Failed to fetch TV shows: \(error)")
            }
        }
    }
    
    
    func  generateImageURL(for profilePath: String?) -> String {
        guard let profilePath = profilePath else { return "" }
        
        let baseImageURL = "https://image.tmdb.org/t/p/"
        let imageSize = "original"
        
        return baseImageURL + imageSize + profilePath
    }
    
}

