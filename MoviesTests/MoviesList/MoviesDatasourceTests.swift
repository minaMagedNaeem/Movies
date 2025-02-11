//
//  Movies.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies

import XCTest
import Moya
@testable import Movies

final class MoviesRemoteDataSourceTests: XCTestCase {
    
    var mockProvider: MockMoviesAPIProvider!
    var dataSource: MoviesRemoteDataSource!
    
    override func setUp() {
        super.setUp()
        mockProvider = MockMoviesAPIProvider()
        dataSource = MoviesRemoteDataSource(apiProvider: mockProvider)
    }
    
    override func tearDown() {
        mockProvider = nil
        dataSource = nil
        super.tearDown()
    }
    
    func testFetchMovies_Success() async {
        // Given
        let jsonData = """
        {
            "results": [
                {
                    "id": 1,
                    "original_title": "Test Movie",
                    "overview": "A test movie",
                    "poster_path": "path",
                    "release_date": "2024-01-01",
                    "title": "Test Movie"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let response = Moya.Response(statusCode: 200, data: jsonData)
        mockProvider.mockResponse = .success(response)
        
        // When
        do {
            let movies = try await dataSource.fetchMovies(page: 1)
            
            // Then
            XCTAssertEqual(movies.count, 1)
            XCTAssertEqual(movies.first?.id, 1)
            XCTAssertEqual(movies.first?.title, "Test Movie")
        } catch {
            XCTFail("Expected success but got failure")
        }
        
        
    }
    
    func testFetchMovies_Failure() async {
        // Given
        mockProvider.mockResponse = .failure(MoyaError.underlying(NSError(domain: "Network", code: -1009, userInfo: nil), nil))
        
        
        // When
        do {
            _ = try await dataSource.fetchMovies(page: 1)
            XCTFail("Expected failure but got success")
        } catch(let error) {
            // Then
            XCTAssertNotNil(error)
        }
    }
    
    func testSearchMovies_Success() async {
        // Given
        let jsonData = """
        {
            "results": [
                {
                    "id": 2,
                    "original_title": "Searched Movie",
                    "overview": "A searched movie",
                    "poster_path": "path",
                    "release_date": "2024-02-01",
                    "title": "Searched Movie"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let response = Moya.Response(statusCode: 200, data: jsonData)
        mockProvider.mockResponse = .success(response)
        
        //let expectation = self.expectation(description: "Search movies successfully")
        
        // When
        do {
            let movies = try await dataSource.searchMovies(page: 1, keyword: "test")
            
            // Then
            XCTAssertEqual(movies.count, 1)
            XCTAssertEqual(movies.first?.id, 2)
            XCTAssertEqual(movies.first?.title, "Searched Movie")
        } catch {
            XCTFail("Expected success but got failure")
        }
        
        
//        dataSource.searchMovies(page: 1, keyword: "Test") { result in
//            switch result {
//            case .success(let movies):
//                XCTAssertEqual(movies.count, 1)
//                XCTAssertEqual(movies.first?.id, 2)
//                XCTAssertEqual(movies.first?.title, "Searched Movie")
//                expectation.fulfill()
//            case .failure:
//                XCTFail("Expected success but got failure")
//            }
//        }
        
        //waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testSearchMovies_Failure() async {
        // Given
        mockProvider.mockResponse = .failure(MoyaError.underlying(NSError(domain: "Network", code: -1009, userInfo: nil), nil))
        
        //let expectation = self.expectation(description: "Search movies failure")
        
        // When
//        dataSource.searchMovies(page: 1, keyword: "Test") { result in
//            switch result {
//            case .success:
//                XCTFail("Expected failure but got success")
//            case .failure(let error):
//                XCTAssertNotNil(error)
//                expectation.fulfill()
//            }
//        }
        
        do {
            _ = try await dataSource.searchMovies(page: 1, keyword: "test")
            
            
            XCTFail("Expected failure but got success")
        } catch(let error) {
            // Then
            XCTAssertNotNil(error)
        }
        
        //waitForExpectations(timeout: 2, handler: nil)
    }
}

