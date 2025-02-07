//
//  SearchMoviesUsecase.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

protocol SearchMoviesUsecase {
    func execute(page: Int, keyword: String) async throws -> [Movie]
}
