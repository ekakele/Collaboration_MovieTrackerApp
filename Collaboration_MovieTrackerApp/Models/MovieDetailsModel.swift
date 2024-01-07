//
//  MovieDetailsModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 06.01.24.
//

import Foundation

// MARK: - MoviesDetail
struct MoviesDetails: Decodable {
    let backdropPath: String
    let budget: Int
    let genres: [DetailsGenre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct DetailsGenre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

