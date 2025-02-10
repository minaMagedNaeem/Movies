//
//  GetSimilarMoviesUsecaseImpl.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

class GetSimilarMoviesUsecaseImpl: GetSimilarMoviesUsecase {
    private var repo: MovieDetailsRepo
    
    init(movieDetailsRepo: MovieDetailsRepo) {
        repo = movieDetailsRepo
    }
    
    func execute(movieId: Int) async throws -> [Movie] {
        return try await repo.getSimilarMovies(to: movieId)
    }
}
