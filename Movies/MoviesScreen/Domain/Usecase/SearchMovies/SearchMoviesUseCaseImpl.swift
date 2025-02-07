//
//  Untitled.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

final class SearchMoviesUseCaseImpl: SearchMoviesUsecase {
    private let repository: MoviesRepository

    init(repository: MoviesRepository) {
        self.repository = repository
    }

    func execute(page: Int, keyword: String) async throws -> [Movie] {
        return try await repository.searchMovies(page: page, keyword: keyword)
    }
}
