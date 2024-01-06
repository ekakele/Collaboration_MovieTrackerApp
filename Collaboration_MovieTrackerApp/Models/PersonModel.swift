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
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Person: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let popularity: Double
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case popularity
        case profilePath = "profile_path"
    }
}

// MARK: - Gender Extension
enum Gender: String {
    case male = "Male"
    case female = "Female"
    case unknown = "Unknown"
}

extension Person {
    var genderString: String {
        switch gender {
        case 1:
            return Gender.female.rawValue
        case 2:
            return Gender.male.rawValue
        default:
            return Gender.unknown.rawValue
        }
    }
}
