//
//  MoviesRepo.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Combine

protocol MoviesRepository {
    func getMovies(page: Int) async throws -> [Movie]
}
