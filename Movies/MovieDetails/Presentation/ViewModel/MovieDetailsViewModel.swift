//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

class MovieDetailsViewModel: Sendable {
    weak var getMovieDetailsDelegate: GetMovieDetailsDelegate?
    weak var getSimilarMoviesDelegate: GetSimilarMoviesDelegate?
    weak var GetTopCastDelegate: GetTopCastDelegate?
    private let movie: Movie
    private let getMovieDetailsUseCase: GetMovieDetailsUsecase
    private let coordinator: Coordinator
    //private let similarMoviesUseCase: SimilarMoviesUseCase
    //private let castUseCase: MovieCastUseCase
    
    private var movieDetails: MovieDetails?
    
    var movieIsAddedToWatchList: Bool {
            get {
                return movie.addedToWatchlist
            }
            set {
                movie.addedToWatchlist = newValue
            }
        }
    
    init(movie: Movie, movieUseCase: GetMovieDetailsUsecase, coordinator: Coordinator)
         //similarMoviesUseCase: SimilarMoviesUseCase,
         //castUseCase: MovieCastUseCase)
    {
        self.movie = movie
        self.coordinator = coordinator
        self.getMovieDetailsUseCase = movieUseCase
        //self.similarMoviesUseCase = similarMoviesUseCase
        //self.castUseCase = castUseCase
    }
    
    func fetchMovieDetails() {
        getMovieDetailsDelegate?.didStartLoading()
        Task {
            do {
                var movieDetails = try await getMovieDetailsUseCase.execute(movieId: movie.id)
                movieDetails = movieDetails
                
                DispatchQueue.main.async {
                                self.getMovieDetailsDelegate?.didFetchMovieDetails(movieDetails)
                            }
            } catch {
                DispatchQueue.main.async {
                                self.getMovieDetailsDelegate?.didFailWithError("Error Fetching movie details")
                            }
            }
        }
        getMovieDetailsDelegate?.didFinishLoading()
    }
    
//    func fetchSimilarMovies(movieId: Int) {
//        similarMoviesUseCase.execute(movieId: movieId) { [weak self] result in
//            switch result {
//            case .success(let movies):
//                let limitedMovies = Array(movies.prefix(5))
//                self?.delegate?.didFetchSimilarMovies(limitedMovies)
//            case .failure(let error):
//                self?.delegate?.didFailWithError(error)
//            }
//        }
//    }
    
//    func fetchTopCast(movieId: Int) {
//        castUseCase.execute(movieId: movieId) { [weak self] result in
//            switch result {
//            case .success(let cast):
//                let directors = cast.filter { $0.department == "Directing" }
//                                    .sorted(by: { $0.popularity > $1.popularity })
//                                    .prefix(5)
//                let actors = cast.filter { $0.department == "Acting" }
//                                 .sorted(by: { $0.popularity > $1.popularity })
//                                 .prefix(5)
//                self?.delegate?.didFetchTopCast(directors: Array(directors), actors: Array(actors))
//            case .failure(let error):
//                self?.delegate?.didFailWithError(error)
//            }
//        }
//    }
}
