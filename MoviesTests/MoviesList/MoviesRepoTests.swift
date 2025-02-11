//
//  MoviesRepoTests.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies

class MoviesRepositoryTests: XCTestCase {
    var repository: MovieRepositoryImpl!
    var mockDataSource: MockMoviesDataSource!
    var mapper: MoviesMapperImpl!
    
    override func setUp() {
        super.setUp()
        mockDataSource = MockMoviesDataSource(apiProvider: MockMoviesAPIProvider())
        mapper = MoviesMapperImpl()
        repository = MovieRepositoryImpl(remoteDataSource: mockDataSource, moviesMapper: mapper)
    }
    
    func testGetMovies_Success() async throws {
        mockDataSource.mockMovies = [MovieDTO(id: 1, originalLanguage: "en", originalTitle: "Test", overview: "Overview", posterPath: "path", releaseDate: "2024-01-01", title: "Test")]
        let movies = try await repository.getMovies(page: 1)
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Test")
    }
    
    func testGetMovies_Failure() async {
        mockDataSource.shouldThrowError = true
        
        do {
            _ = try await repository.getMovies(page: 1)
            XCTFail("Expected error but got success")
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
