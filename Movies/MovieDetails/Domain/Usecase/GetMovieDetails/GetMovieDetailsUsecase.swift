//
//  GetMovieDetailsUsecase.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol GetMovieDetailsUsecase {
    func execute(movieId: Int) async throws -> MovieDetails
}
