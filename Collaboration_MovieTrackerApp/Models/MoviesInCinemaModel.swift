//
//  MoviesInCinemaModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation

// MARK: - Result
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

struct DateRange: Codable {
    let maximum: String
    let minimum: String
}

struct Movie: Codable {
    let genreIds: [Int]
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
