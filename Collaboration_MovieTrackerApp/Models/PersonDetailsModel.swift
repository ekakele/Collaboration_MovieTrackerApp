//
//  PersonDetailsModel.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Eka Kelenjeridze on 06.01.24.
//

import Foundation

// MARK: - PersonDetailsModel
struct PersonDetailsModel: Decodable {
    let adult: Bool
    let alsoKnownAs: [String]
    let biography: String
    let birthday: String
    let gender: Int
    let id: Int
    let imdbID: String
    let knownForDepartment: String
    let name: String
    let placeOfBirth: String
    let popularity: Double
    let profilePath: String
    let genderString: String

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, gender, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
        case genderString
    }
}

// MARK: - Gender Enum
enum GenderInfo: Int, CaseIterable {
    case notSet = 0
    case female = 1
    case male = 2
    case nonBinary = 3

    var genderString: String {
        switch self {
        case .notSet:
            return "Not specified"
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .nonBinary:
            return "Non-binary"
        }
    }
}
