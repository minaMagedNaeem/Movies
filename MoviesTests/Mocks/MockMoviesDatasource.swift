//
//  MockMoviesDatasource.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
import Moya
@testable import Movies

class MockMoviesDataSource: MoviesDataSource {
    var mockMovies: [MovieDTO] = []
    var shouldThrowError = false
    let mockApiProvider: MoyaProvider<MoviesAPI>
    
    required init(apiProvider: Moya.MoyaProvider<Movies.MoviesAPI>) {
        self.mockApiProvider = apiProvider
    }
    
    func fetchMovies(page: Int) async throws -> [MovieDTO] {
        if shouldThrowError { throw NSError(domain: "TestError", code: -1, userInfo: nil) }
        return mockMovies
    }
    
    func searchMovies(page: Int, keyword: String) async throws -> [MovieDTO] {
        if shouldThrowError { throw NSError(domain: "TestError", code: -1, userInfo: nil) }
        return mockMovies
    }
}
