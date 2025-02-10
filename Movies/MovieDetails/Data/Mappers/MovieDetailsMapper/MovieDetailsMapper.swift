//
//  Mo.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//

protocol MovieDetailsMapper {
    func map(from movieDetailDTO: MovieDetailsDTO) -> MovieDetails
}
