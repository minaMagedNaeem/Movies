//
//  MovieDetailsRepo.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol MovieDetailsRepo {
    func getMovieDetails(movieId: Int) async throws -> MovieDetails
    func getSimilarMovies(to movieId: Int) async throws -> [Movie]
    func getCast(of movieId: Int) async throws -> CastInfo
}
