//
//  GetSimilarMoviesUsecase.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

protocol GetSimilarMoviesUsecase {
    func execute(movieId: Int) async throws -> [Movie]
}
