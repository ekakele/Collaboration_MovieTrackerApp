//
//  MoviesInCinemaModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation

struct MoviesData: Decodable {
    let movies: [MovieResult]
}

// MARK: - Result
struct MovieResult: Codable {
    let genreIDS: [Int]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let imdbRating: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case imdbRating = "vote_average"
        case voteCount = "vote_count"
    }
}
