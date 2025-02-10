//
//  DepartmentDTO.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

enum Department: String, Codable {
    case acting = "Acting"
    case directing = "Directing"
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        self = Department(rawValue: rawValue) ?? .unknown
    }
}
