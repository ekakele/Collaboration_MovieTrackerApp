//
//  PopularMoviesModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let image:  String
    let title: String
    var shortInfo: String
    var genre: [Genre]
    var imdbRating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case image = "poster_path"
        case title = "original_title"
        case shortInfo = "overview"
        case genre = "genre_ids"
        case imdbRating = "vote_average"
    }
}

struct Response: Codable {
  let results: [Movie]
}

enum Genre: Int, Codable {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mystery = 9648
    case romance = 10749
    case scienceFiction = 878
    case tvMovie = 10770
    case thriller = 53
    case war = 10752
    case western = 37
    
    var rawValue: String {
        switch self {
        case .action: "action"
        case .adventure: "adventure"
        case .animation: "animation"
        case .comedy: "comedy"
        case .crime: "crime"
        case .documentary: "documentary"
        case .drama: "drama"
        case .family: "family"
        case .fantasy: "fantasy"
        case .history: "history"
        case .horror: "horror"
        case .music: "music"
        case .mystery: "mystery"
        case .romance: "romance"
        case .scienceFiction: "scienceFiction"
        case .tvMovie: "tvMovie"
        case .thriller: "thriller"
        case .war: "war"
        case .western: "western"
        }
    }
}



