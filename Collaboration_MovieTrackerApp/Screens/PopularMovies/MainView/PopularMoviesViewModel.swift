//
//  PopularMoviesViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

final class PopularMoviesViewModel: ObservableObject {
    //MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var movies: [Movie] = []
    
    //MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
        fetchData()
    }
    
    //MARK: - Methods
    func fetchData() {
        let endpointString = "3/movie/popular?api_key=44eb1481b98d9c5e2d312757977b5c5a"
        networkManager.fetchData(endpoint: endpointString) { (result: Result<PopularMoviesResponse, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.movies = data.results
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func generateImageURL(for imagePath: String?) -> String {
        guard let imagePath = imagePath else { return "" }
        
        let baseImageURL = "https://image.tmdb.org/t/p/"
        let imageSize = "original"
        
        return baseImageURL + imageSize + imagePath
    }
}
