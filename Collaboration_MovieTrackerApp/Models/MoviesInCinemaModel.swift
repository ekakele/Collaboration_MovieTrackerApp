//
//  MoviesInCinemaModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let dates: DateRange
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
// MARK: - DateRange
struct DateRange: Codable {
    let maximum: String
    let minimum: String
}

struct Movie: Codable {
    let genreIds: [Genre]
    let id: Int
    let shortInfo: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let imdbRating: Double
    
    private enum CodingKeys: String, CodingKey {
        case genreIds = "genre_ids"
        case id
        case shortInfo = "overview"
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case imdbRating = "vote_average"
    }
}

// MARK: - Genre
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
        case .action: "Action"
        case .adventure: "Adventure"
        case .animation: "Animation"
        case .comedy: "Comedy"
        case .crime: "Crime"
        case .documentary: "Documentary"
        case .drama: "Drama"
        case .family: "Family"
        case .fantasy: "Fantasy"
        case .history: "History"
        case .horror: "Horror"
        case .music: "Music"
        case .mystery: "Mystery"
        case .romance: "Romance"
        case .scienceFiction: "ScienceFiction"
        case .tvMovie: "TvMovie"
        case .thriller: "Thriller"
        case .war: "War"
        case .western: "Western"
        }
    }
}
