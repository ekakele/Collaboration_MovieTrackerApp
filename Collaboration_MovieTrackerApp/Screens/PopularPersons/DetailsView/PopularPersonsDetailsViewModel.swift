//
//  PopularPersonsDetailsViewModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation
import GenericNetworkManager

class PopularPersonsDetailsViewModel: ObservableObject {
    // MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var person: PersonDetailsModel?
    
    // MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.themoviedb.org/")
    }
    
    //MARK: - Methods
    func fetchData(with id: Int) {
        let endpointString = "3/person/\(id)?api_key=0f6687ab3afdd8a96e987121cf0841bb"
        networkManager.fetchData(endpoint: endpointString) { (result: Result<PersonDetailsModel, Error>) in
            switch result {
            case .success(let data):
                //                print(data)
                DispatchQueue.main.async {
                    self.person = data.self
                }
            case .failure(let error):
                print("Error fetching items: \(error)")
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
