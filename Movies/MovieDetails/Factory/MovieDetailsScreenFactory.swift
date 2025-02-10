//
//  MovieDetailsScreenFactory.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

class MovieDetailsScreenFactory {
    static func get(movie: Movie, coordinator: Coordinator) -> MovieDetailsTabBarViewController {
        
        let datasource = MovieDetailsDatasourceImpl()
        let moviesMapper = MoviesMapperImpl()
        let movieDetailsMapper = MovieDetailsMapperImpl()
        let castMapper = CastResponseMapperImpl()
        let repo = MovieDetailsRepoImpl(remoteDataSource: datasource,
                                        movieDetailsMapper: movieDetailsMapper,
                                        moviesMapper: moviesMapper,
                                        castResponseMapper: castMapper)
        let getMovieDetailsUsecase = GetMovieDetailsUsecaseImpl(movieDetailsRepo: repo)
        let getSimilarMoviesUsecase = GetSimilarMoviesUsecaseImpl(movieDetailsRepo: repo)
        let getCastAndCrewUsecase = GetCaseAndCrewUsecaseImpl(movieDetailsRepo: repo)
        let viewModel = MovieDetailsViewModel(movie: movie,
                                              movieUseCase: getMovieDetailsUsecase,
                                              getSimilarMoviesUsecase: getSimilarMoviesUsecase,
                                              getCastAndCrewUsecase: getCastAndCrewUsecase,
                                              coordinator: coordinator)
        
        return MovieDetailsTabBarViewController(movieDetailsViewModel: viewModel)
    }
}
