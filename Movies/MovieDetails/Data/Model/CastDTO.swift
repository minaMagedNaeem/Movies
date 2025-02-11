//
//  CastDTO.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

class CastDTO: Codable {
    let id: Int
    let knownForDepartment: Department?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let department: Department?
    
    enum CodingKeys: String, CodingKey {
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case department
    }
}
