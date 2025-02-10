//
//  MovieDetailsMapper.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation

class MovieDetailsMapperImpl: MovieDetailsMapper {
    func map(from movieDetailDTO: MovieDetailsDTO) -> MovieDetails {
        return MovieDetails(id: movieDetailDTO.id,
                            originalTitle: movieDetailDTO.originalTitle,
                            overview: movieDetailDTO.overview,
                            posterPath: movieDetailDTO.posterPath,
                            releaseDate: Date.init(from: movieDetailDTO.releaseDate),
                            revenue: movieDetailDTO.revenue,
                            status: movieDetailDTO.status,
                            tagline: movieDetailDTO.tagline,
                            title: movieDetailDTO.title)
    }
}
