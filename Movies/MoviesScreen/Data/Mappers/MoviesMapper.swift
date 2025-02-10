//
//  Untitled.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//

protocol MoviesMapper {
    func map(moviesDTO: [MovieDTO]) -> [Movie]
}
