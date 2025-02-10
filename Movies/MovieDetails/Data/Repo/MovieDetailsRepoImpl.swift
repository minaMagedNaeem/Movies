//
//  MovieDetailsRepoImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieDetailsRepoImpl: MovieDetailsRepo {
    private let remoteDataSource: MovieDetailsDataSource
    private let movieDetailsMapper: MovieDetailsMapper
    private let moviesMapper: MoviesMapper
    private let castResponseMapper: CastResponseMapper
    
    init(remoteDataSource: MovieDetailsDataSource, movieDetailsMapper: MovieDetailsMapper, moviesMapper: MoviesMapper, castResponseMapper: CastResponseMapper) {
        self.remoteDataSource = remoteDataSource
        self.movieDetailsMapper = movieDetailsMapper
        self.moviesMapper = moviesMapper
        self.castResponseMapper = castResponseMapper
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetails {
        let movieDetailsDTO = try await remoteDataSource.getMovieDetails(movieId: movieId)
        return movieDetailsMapper.map(from: movieDetailsDTO)
    }
    
    func getSimilarMovies(to movieId: Int) async throws -> [Movie] {
        let movieDTOs = try await remoteDataSource.getSimilarMovies(to: movieId)
        return moviesMapper.map(moviesDTO: movieDTOs)
    }
    
    func getCast(of movieId: Int) async throws -> CastInfo {
        let castResponseDTO = try await remoteDataSource.getCast(of: movieId)
        return castResponseMapper.map(from: castResponseDTO)
    }
}
