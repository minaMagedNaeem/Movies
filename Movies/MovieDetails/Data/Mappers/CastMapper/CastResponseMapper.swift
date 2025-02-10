//
//  CastResponseMapper.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//

protocol CastResponseMapper {
    func map(from castResponseDTO: CastResponseDTO) -> CastInfo
}
