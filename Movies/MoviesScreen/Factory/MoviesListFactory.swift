//
//  MoviesListFactory.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MoviesListFactory {
    @MainActor static func get() -> MoviesListView {
        let moviesDataSource = MoviesRemoteDataSource()
        let getMoviesRepo = MovieRepositoryImpl(remoteDataSource: moviesDataSource)
        let getMoviesUseCase = GetMoviesUseCaseImpl(repository: getMoviesRepo)
        let viewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase)
        return MoviesListView(viewModel: viewModel)
    }
}
