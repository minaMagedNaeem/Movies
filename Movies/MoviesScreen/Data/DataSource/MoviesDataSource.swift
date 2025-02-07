//
//  DataSource.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Combine

protocol MoviesDataSource {
    func fetchMovies(page: Int) async throws -> [MovieDTO]
}
