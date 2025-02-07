//
//  MovieDetailsRepoImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieDetailsRepoImpl: MovieDetailsRepo {
    private let remoteDataSource: MovieDetailsDataSource
    
    init(remoteDataSource: MovieDetailsDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetails {
        let movieDetailsDTO = try await remoteDataSource.getMovieDetails(movieId: movieId)
        return MovieDetailsMapper.map(from: movieDetailsDTO)
    }
}
