//
//  DataSource.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Moya

protocol MoviesDataSource {
    init(apiProvider: MoyaProvider<MoviesAPI>)
    
    func fetchMovies(page: Int) async throws -> [MovieDTO]
    func searchMovies(page: Int, keyword: String) async throws -> [MovieDTO]
}
