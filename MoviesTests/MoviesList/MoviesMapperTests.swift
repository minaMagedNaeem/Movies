//
//  MoviesMapperTests.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies

class MoviesMapperTests: XCTestCase {
    var mapper: MoviesMapperImpl!
    
    override func setUp() {
        super.setUp()
        mapper = MoviesMapperImpl()
    }
    
    func testMapMovies() {
        let dto = MovieDTO(id: 1, originalLanguage: "en", originalTitle: "Test Movie", overview: "A test", posterPath: "path", releaseDate: "2024-01-01", title: "Test")
        let movies = mapper.map(moviesDTO: [dto])
        
        XCTAssertEqual(movies.count, 1)
        XCTAssertEqual(movies.first?.title, "Test")
        XCTAssertEqual(Calendar.current.component(.year, from: movies.first?.releaseDate ?? Date()), 2024)
    }
}
