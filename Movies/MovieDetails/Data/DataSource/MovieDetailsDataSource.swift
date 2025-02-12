//
//  GetMovieDetailsDataSource.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Moya

protocol MovieDetailsDataSource {
    
    init(apiProvider: MoyaProvider<MoviesAPI>)
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsDTO
    func getSimilarMovies(to movieId: Int) async throws -> [MovieDTO]
    func getCast(of movieId: Int) async throws -> CastResponseDTO
}
