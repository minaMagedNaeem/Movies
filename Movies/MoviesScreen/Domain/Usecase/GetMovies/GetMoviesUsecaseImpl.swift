//
//  GetMoviesUsecaseImpl.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

final class GetMoviesUseCaseImpl: GetMoviesUseCase {
    private let repository: MoviesRepository

    init(repository: MoviesRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> [Movie] {
        return try await repository.getMovies(page: page)
    }
}
