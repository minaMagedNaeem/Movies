//
//  MoviesRepoImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieRepositoryImpl: MoviesRepository {
    
    private let remoteDataSource: MoviesDataSource
    private let moviesMapper: MoviesMapper
    
    init(remoteDataSource: any MoviesDataSource, moviesMapper: any MoviesMapper) {
        self.remoteDataSource = remoteDataSource
        self.moviesMapper = moviesMapper
    }
    
    func getMovies(page: Int) async throws -> [Movie] {
        let movieDTOs = try await remoteDataSource.fetchMovies(page: page)
        return moviesMapper.map(moviesDTO: movieDTOs)
    }
    
    func searchMovies(page: Int, keyword: String) async throws -> [Movie] {
        let movieDTOs = try await remoteDataSource.searchMovies(page: page, keyword: keyword)
        return moviesMapper.map(moviesDTO: movieDTOs)
    }
}
