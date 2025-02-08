//
//  GetCastAndCrewUsecase.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

protocol GetCastAndCrewUsecase {
    func execute(of movieId: Int) async throws -> CastInfo
}
