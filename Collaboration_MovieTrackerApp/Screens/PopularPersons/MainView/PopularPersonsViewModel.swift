//
//  PopularPersonsViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

class PopularPersonsViewModel: ObservableObject {
    // MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var persons: [Person] = []
    
    // MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
        fetchData()
    }
    
    //MARK: - Methods
    func fetchData() {
        let endpointString = "3/person/popular?api_key=0f6687ab3afdd8a96e987121cf0841bb&page=2"
        networkManager.fetchData(endpoint: endpointString) { (result: Result<PersonModel, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.persons = data.results
                }
            case .failure(let error):
                print("Error fetching items: \(error)")
            }
        }
    }
    
    func generateImageURL(for profilePath: String?) -> String? {
        guard let profilePath = profilePath else { return "" }
        
        let baseImageURL = "https://image.tmdb.org/t/p/"
        let imageSize = "original"
        
        return baseImageURL + imageSize + profilePath
    }
}
