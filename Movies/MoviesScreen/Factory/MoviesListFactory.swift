//
//  MoviesListFactory.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MoviesListFactory {
    @MainActor static func get(coordinator: Coordinator) -> MoviesListViewController {
        let moviesDataSource = MoviesRemoteDataSource()
        let moviesRepo = MovieRepositoryImpl(remoteDataSource: moviesDataSource)
        let getMoviesUseCase = GetMoviesUseCaseImpl(repository: moviesRepo)
        let searchMoviesUseCase = SearchMoviesUseCaseImpl(repository: moviesRepo)
        let viewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase, searchMoviesUseCase: searchMoviesUseCase, coordinator: coordinator)
        let moviesListView = MoviesListView(viewModel: viewModel)
        
        return MoviesListViewController(moviesListView: moviesListView)
    }
}
