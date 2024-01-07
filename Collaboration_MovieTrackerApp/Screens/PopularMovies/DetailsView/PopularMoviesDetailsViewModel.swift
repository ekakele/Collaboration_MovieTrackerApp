//
//  PopularMoviesDetailsViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

final class PopularMoviesDetailsViewModel: ObservableObject {
    //MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var moviesDetails: MoviesDetails?
    var selectedMovie: Movie
    
    //MARK: - Init
    init(movie: Movie) {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
        self.selectedMovie = movie
    }
    
    //MARK: - Methods
    func fetchData() {
        let endpointString = "3/movie/\(selectedMovie.id)?api_key=5640b394ad4d380d373cddff07791a1c"
        networkManager.fetchData(endpoint: endpointString) { (result: Result<MoviesDetails, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.moviesDetails = data
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
