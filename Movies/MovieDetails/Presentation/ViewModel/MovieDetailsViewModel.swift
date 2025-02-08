//
//  MovieDetailsViewModel.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

final class MovieDetailsViewModel: Sendable {
    
    let maxSimilarMoviesNumber = 5
    
    weak var getMovieDetailsDelegate: GetMovieDetailsDelegate?
    weak var getSimilarMoviesDelegate: GetSimilarMoviesDelegate?
    weak var GetTopCastDelegate: GetTopCastDelegate?
    private let movie: Movie
    private let getMovieDetailsUseCase: GetMovieDetailsUsecase
    private let getSimilarMoviesUseCase: GetSimilarMoviesUsecase
    private let getCastAndCrewUseCase: GetCastAndCrewUsecase
    private let coordinator: Coordinator
    
    private var movieDetails: MovieDetails?
    private var similarMovies: [Movie]?
    private var topActors: [Cast]?
    private var topDirectors: [Cast]?
    
    var movieIsAddedToWatchList: Bool {
            get {
                return movie.addedToWatchlist
            }
            set {
                movie.addedToWatchlist = newValue
            }
        }
    
    init(movie: Movie, movieUseCase: GetMovieDetailsUsecase, getSimilarMoviesUsecase: GetSimilarMoviesUsecase, getCastAndCrewUsecase: GetCastAndCrewUsecase, coordinator: Coordinator)
         //castUseCase: MovieCastUseCase)
    {
        self.movie = movie
        self.coordinator = coordinator
        self.getMovieDetailsUseCase = movieUseCase
        self.getSimilarMoviesUseCase = getSimilarMoviesUsecase
        self.getCastAndCrewUseCase = getCastAndCrewUsecase
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
    
    func fetchSimilarMovies() {
        getSimilarMoviesDelegate?.didStartLoading()
        
        Task {
            do {
                let movies = Array(try await getSimilarMoviesUseCase.execute(movieId: movie.id).prefix(maxSimilarMoviesNumber))
                similarMovies = movies
                
                DispatchQueue.main.async {
                    self.getSimilarMoviesDelegate?.didFetchSimilarMovies()
                }
            } catch {
                DispatchQueue.main.async {
                    self.getSimilarMoviesDelegate?.didFailWithError("Error Fetching movie details")
                }
            }
        }
    }
    
    var similarMoviesCount: Int {
        return similarMovies?.count ?? 0
    }
    
    func getSimilarMovie(at index: Int) -> Movie? {
        return similarMovies?[index]
    }
    
    func fetchCast() {
        GetTopCastDelegate?.didStartLoading()
            Task {
                do {
                    let movies = try await getSimilarMoviesUseCase.execute(movieId: movie.id)
                    self.similarMovies = Array(movies.prefix(5))
                    
                    var allCasts: [Cast] = []
                    
                    for movie in self.similarMovies ?? [] {
                        let castInfo = try await getCastAndCrewUseCase.execute(of: movie.id)
                        allCasts.append(contentsOf: castInfo.cast)
                        allCasts.append(contentsOf: castInfo.crew)
                    }

                    // Filter only Actors and Directors
                    let actors = allCasts.filter { $0.department == .acting }
                    let directors = allCasts.filter { $0.department == .directing }

                    // Sort by popularity
                    self.topActors = Array(actors.sorted(by: { ($0.popularity ?? 0) > ($1.popularity ?? 0) }).prefix(5))
                    self.topDirectors = Array(directors.sorted(by: { ($0.popularity ?? 0) > ($1.popularity ?? 0) }).prefix(5))

                    DispatchQueue.main.async {
                        self.GetTopCastDelegate?.didFetchTopCast()
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.GetTopCastDelegate?.didFailWithError("Failed to fetch cast details.")
                    }
                }
            }
        }
    
    var topActorsCount: Int {
        return topActors?.count ?? 0
    }
    
    var topDirectorsCount: Int {
        return topDirectors?.count ?? 0
    }
    
    func getActor(at index: Int) -> Cast? {
        return topActors?[index]
    }
    
    func getDirector(at index: Int) -> Cast? {
        return topDirectors?[index]
    }
}
