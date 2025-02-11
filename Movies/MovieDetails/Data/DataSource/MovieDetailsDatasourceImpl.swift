//
//  MovieDetailsDatasourceImp.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation
import Moya

class MovieDetailsDatasourceImpl: MovieDetailsDataSource {
    
    let apiProvider: MoyaProvider<MoviesAPI>
    
    required init(apiProvider: MoyaProvider<MoviesAPI>) {
        self.apiProvider = apiProvider
    }
    
    func getMovieDetails(movieId: Int) async throws -> MovieDetailsDTO {
        return try await withCheckedThrowingContinuation { continuation in
            apiProvider.request(.getMovieDetails(movieId: movieId)) { result in
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
            apiProvider.request(.getSimilarMovies(movieId: movieId)) { result in
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
    
    func getCast(of movieId: Int) async throws -> CastResponseDTO {
        return try await withCheckedThrowingContinuation { continuation in
            apiProvider.request(.getCast(movieId: movieId)) { result in
                switch result {
                case .success(let response):
                    do {
                        let castResponseDTO = try JSONDecoder().decode(CastResponseDTO.self, from: response.data)
                        continuation.resume(returning: castResponseDTO)
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
