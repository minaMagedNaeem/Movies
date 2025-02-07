//
//  MovieDetailsScreenFactory.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieDetailsScreenFactory {
    static func get(movie: Movie, coordinator: Coordinator) -> MovieDetailsTabBarViewController {
        
        let datasource = MovieDetailsDatasourceImpl()
        let repo = MovieDetailsRepoImpl(remoteDataSource: datasource)
        let usecase = GetMovieDetailsUsecaseImpl(movieDetailsRepo: repo)
        let viewModel = MovieDetailsViewModel(movie: movie, movieUseCase: usecase, coordinator: coordinator)
        return MovieDetailsTabBarViewController(movieDetailsViewModel: viewModel)
    }
}
