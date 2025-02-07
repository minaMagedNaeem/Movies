//
//  GetMoviesUsecase.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol GetMoviesUseCase {
    func execute(page: Int) async throws -> [Movie]
}
