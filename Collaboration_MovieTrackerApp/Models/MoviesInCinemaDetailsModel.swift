//
//  MoviesInCinemaDetailsModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 06.01.24.
//

import Foundation

// MARK: - AuthorResponse
struct AuthorResponse: Decodable {
    let results: [Review]
}

// MARK: - Review
struct Review: Decodable {
    let author: String
    let content: String
    let createdAt: String
    let id: String
    let updatedAt: String
    let url: String
    let authorDetails: AuthorDetails

    enum CodingKeys: String, CodingKey {
        case author
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
        case authorDetails = "author_details"
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Decodable {
    let name: String
    let username: String
    let avatarPath: String?
    let rating: Double?
}
