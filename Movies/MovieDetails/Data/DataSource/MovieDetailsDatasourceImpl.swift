//
//  MovieDetailsDatasourceImp.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

class MovieDetailsDatasourceImpl: MovieDetailsDataSource {
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsDTO {
        return try await withCheckedThrowingContinuation { continuation in
            moviesAPIProvider.request(.getMovieDetails(movieId: movieId)) { result in
                switch result {
                case .success(let response):
                    do {
                        let movieDetailsDTO = try JSONDecoder().decode(MovieDetailsDTO.self, from: response.data)
                        continuation.resume(returning: movieDetailsDTO)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getSimilarMovies(to movieId: Int) async throws -> [MovieDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            moviesAPIProvider.request(.getSimilarMovies(movieId: movieId)) { result in
                switch result {
                case .success(let response):
                    do {
                        let moviesDTO = try JSONDecoder().decode(MoviesResponseDTO.self, from: response.data).results
                        continuation.resume(returning: moviesDTO)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
