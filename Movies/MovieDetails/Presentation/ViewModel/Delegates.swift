//
//  Delegates.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol MovieDetailsViewModelDelegate: AnyObject {
    func didStartLoading()
    func didFinishLoading()
    func didFailWithError(_ error: String)
}

protocol GetMovieDetailsDelegate: MovieDetailsViewModelDelegate {
    
    func didFetchMovieDetails(_ details: MovieDetails)
}

protocol GetSimilarMoviesDelegate: MovieDetailsViewModelDelegate {
    func didFetchSimilarMovies(_ movies: [Movie])
}

protocol GetTopCastDelegate: MovieDetailsViewModelDelegate {
    //func didFetchTopCast(directors: [CastMember], actors: [CastMember])
}
