//
//  MovieDetailsDTO.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieDetailsDTO: Codable {
    let id: Int
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: String?
    let revenue: Int?
    let status, tagline, title: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case status, tagline, title
    }
}
