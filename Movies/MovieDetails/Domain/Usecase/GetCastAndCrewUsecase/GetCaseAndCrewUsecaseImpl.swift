//
//  GetCaseAndCrewUsecaseImpl.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

class GetCaseAndCrewUsecaseImpl: GetCastAndCrewUsecase {
    private var repo: MovieDetailsRepo
    
    init(movieDetailsRepo: MovieDetailsRepo) {
        repo = movieDetailsRepo
    }
    
    func execute(of movieId: Int) async throws -> CastInfo {
        return try await repo.getCast(of: movieId)
    }
}
