//
//  MoviesInCinemaViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

final class MoviesInCinemaViewModel: ObservableObject {
    //MARK: - Properties
    @Published var results: [MovieInCinema] = []
    private var networkManager: GenericNetworkManager
    
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
        fetchMovies()
    }
    
    //MARK: - Methods
    func fetchMovies() {
        let endpointString = "3/movie/now_playing?api_key=07f64a8ccb5e3a20cc73fa3633167639&page=2"
        
        networkManager.fetchData(endpoint: endpointString) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.results = data.results
                }
            case.failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
    
    func generateImageURL(for profilePath: String?) -> String {
        guard let profilePath = profilePath else { return "" }
        
        let baseImageURL = "https://image.tmdb.org/t/p/"
        let imageSize = "original"
        
        return baseImageURL + imageSize + profilePath
    }
}
