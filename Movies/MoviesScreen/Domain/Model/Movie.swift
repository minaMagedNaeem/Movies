//
//  DomainMovie.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import SwiftUI

class Movie: ObservableObject, Identifiable, @unchecked Sendable {
    let id: Int
    let originalLanguage, originalTitle, overview: String?
    let posterPath, title: String?
    let releaseDate: Date?
    
    @Published var addedToWatchlist: Bool
    
    init(id: Int, originalLanguage: String?, originalTitle: String?, overview: String?, posterPath: String?, releaseDate: Date?, title: String?, addedToWatchList: Bool) {
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.addedToWatchlist = addedToWatchList
    }
}
