//
//  GetMovieDetailsDataSource.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol MovieDetailsDataSource {
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsDTO
}
