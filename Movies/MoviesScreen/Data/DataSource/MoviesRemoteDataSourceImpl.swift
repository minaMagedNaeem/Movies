//
//  MoviesDataSource.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Combine
import Foundation

class MoviesRemoteDataSource: MoviesDataSource {
    
    func fetchMovies(page: Int) async throws -> [MovieDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            moviesAPIProvider.request(.getMovies(page: page)) { result in
                switch result {
                case .success(let response):
                    do {
                        let movies = try JSONDecoder().decode(MoviesResponseDTO.self, from: response.data).results
                        continuation.resume(returning: movies)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func searchMovies(page: Int, keyword: String) async throws -> [MovieDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            moviesAPIProvider.request(.searchMovies(page: page, keyword: keyword)) { result in
                switch result {
                case .success(let response):
                    do {
                        let movies = try JSONDecoder().decode(MoviesResponseDTO.self, from: response.data).results
                        continuation.resume(returning: movies)
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
