//
//  MoviesInCinemaDetailsViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

final class MoviesInCinemaDetailsViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var reviewResults: [Review] = []
    private var networkManager: GenericNetworkManager
    
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
    }
    
    //MARK: Fetch
    func fetchReviews(movieID: Int) {
        
        let endpointString = "3/movie/\(movieID)/reviews?api_key=07f64a8ccb5e3a20cc73fa3633167639"
        
        networkManager.fetchData(endpoint: endpointString) { (result: Result<AuthorResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.reviewResults = data.results
                }
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
}
