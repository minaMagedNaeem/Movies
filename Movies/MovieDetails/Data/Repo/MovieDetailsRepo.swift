//
//  MovieDetailsRepo.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol MovieDetailsRepo {
    func getMovieDetails(movieId: Int) async throws -> MovieDetails
}
