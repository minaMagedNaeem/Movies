//
//  MovieDetails.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

@MainActor
class MovieDetails: Sendable {
    let id: Int
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate: Date?
    let revenue: Int?
    let status, tagline, title: String?
    
    init(id: Int, originalTitle: String?, overview: String?, posterPath: String?, releaseDate: Date?, revenue: Int?, status: String?, tagline: String?, title: String?) {
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.status = status
        self.tagline = tagline
        self.title = title
    }
}
