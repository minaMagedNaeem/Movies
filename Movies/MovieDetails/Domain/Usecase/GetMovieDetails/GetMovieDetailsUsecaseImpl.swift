//
//  GetMovieDetailsUsecaseImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class GetMovieDetailsUsecaseImpl: GetMovieDetailsUsecase {
    
    private var repo: MovieDetailsRepo
    
    init(movieDetailsRepo: MovieDetailsRepo) {
        repo = movieDetailsRepo
    }
    
    func execute(movieId: Int) async throws -> MovieDetails {
        return try await repo.getMovieDetails(movieId: movieId)
    }
    
    
}
