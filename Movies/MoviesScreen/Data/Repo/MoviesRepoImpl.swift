//
//  MoviesRepoImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieRepositoryImpl: MoviesRepository {
    private let remoteDataSource: MoviesDataSource
    
    init(remoteDataSource: MoviesDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovies(page: Int) async throws -> [Movie] {
        let movieDTOs = try await remoteDataSource.fetchMovies(page: page)
        return MoviesMapper.map(moviesDTO: movieDTOs)
    }
    
    func searchMovies(page: Int, keyword: String) async throws -> [Movie] {
        let movieDTOs = try await remoteDataSource.searchMovies(page: page, keyword: keyword)
        return MoviesMapper.map(moviesDTO: movieDTOs)
    }
}
