//
//  MoviesIntegrationTests.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies

class MoviesViewModelTests: XCTestCase {
    var viewModel: MoviesListViewModelImpl!
    var getMoviesUseCase: GetMoviesUseCaseImpl!
    var searchMoviesUseCase: SearchMoviesUseCaseImpl!
    var mockRepository: MovieRepositoryImpl!
    var mockDataSource: MockMoviesDataSource!
    var mockCoordinator: MockCoordinator!
    
    override func setUp() {
        super.setUp()
        mockDataSource = MockMoviesDataSource()
        let mapper = MoviesMapperImpl()
        mockRepository = MovieRepositoryImpl(remoteDataSource: mockDataSource, moviesMapper: mapper)
        getMoviesUseCase = GetMoviesUseCaseImpl(repository: mockRepository)
        searchMoviesUseCase = SearchMoviesUseCaseImpl(repository: mockRepository)
        mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        viewModel = MoviesListViewModelImpl(getMoviesUseCase: getMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase, coordinator: mockCoordinator)
    }
    
    func testLoadMovies_Success() async {
        mockDataSource.mockMovies = [MovieDTO(id: 1, originalLanguage: "en", originalTitle: "Test", overview: "Overview", posterPath: "path", releaseDate: "2024-01-01", title: "Test")]
        await viewModel.loadMovies()
        
        XCTAssertEqual(viewModel.groupedMovies.count, 1)
    }
    
    func testLoadMovies_Failure() async {
        mockDataSource.shouldThrowError = true
        await viewModel.loadMovies()
        
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
