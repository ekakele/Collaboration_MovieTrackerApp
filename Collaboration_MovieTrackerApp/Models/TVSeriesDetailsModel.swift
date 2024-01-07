//
//  TVSeriesDetailsModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 06.01.24.
//

import Foundation

struct TVShowDetails: Decodable {
    let adult: Bool
    let backdropPath: String?
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let lastEpisodeToAir: Episode
    let name: String
    let nextEpisodeToAir: Episode
    let networks: [Network]
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let seasons: [Season]
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
    let type: String
    let voteAverage: Double
    let voteCount: Int

    struct Genre: Decodable {
        let id: Int
        let name: String
    }

    struct Episode: Decodable {
        let id: Int
        let name: String
        let overview: String
        let voteAverage: Double
        let voteCount: Int
        let airDate: String
        let episodeNumber: Int
        let episodeType: String
        let productionCode: String
        let runtime: Int
        let seasonNumber: Int
        let showID: Int
        let stillPath: String?
    }

    struct Network: Decodable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String
    }

    struct ProductionCompany: Decodable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String
    }

    struct ProductionCountry: Decodable {
        let iso31661: String
        let name: String
    }

    struct Season: Decodable {
        let airDate: String
        let episodeCount: Int
        let id: Int
        let name: String
        let overview: String
        let posterPath: String?
        let seasonNumber: Int
        let voteAverage: Double
    }

    struct SpokenLanguage: Decodable {
        let englishName: String
        let iso6391: String
        let name: String
    }
}


