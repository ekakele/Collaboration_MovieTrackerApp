//
//  PopularPersonsModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 05.01.24.
//

import Foundation

// MARK: - PersonModel
struct PersonModel: Decodable {
    let results: [Person]

//    let page: Int
//    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results
//        case page
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Person: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String
    let knownFor: [KnownFor]

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Decodable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Decodable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Decodable {
    case en = "en"
    case es = "es"
    case fr = "fr"
    case hi = "hi"
    case ja = "ja"
    case ta = "ta"
    case te = "te"
}
//
//enum KnownForDepartment: String, Decodable {
//    case acting = "Acting"
//    case writing = "Writing"
//}
