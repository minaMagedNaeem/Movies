//
//  Movie.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation

class MovieDTO: Codable {
    let id: Int
    let originalLanguage, originalTitle, overview: String?
    let posterPath, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
    
    init(id: Int, originalLanguage: String, originalTitle: String, overview: String, posterPath: String, releaseDate: String, title: String) {
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
    }
}
