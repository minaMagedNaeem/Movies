//
//  MovieToDomainMoviewMapper.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

class MoviesMapperImpl: MoviesMapper {
    func map(moviesDTO: [MovieDTO]) -> [Movie] {
        return moviesDTO.map { movie in
            Movie(id: movie.id,
                  originalLanguage: movie.originalLanguage,
                  originalTitle: movie.originalTitle,
                  overview: movie.overview,
                  posterPath: movie.posterPath,
                  releaseDate: Date.init(from: movie.releaseDate),
                  title: movie.title,
                  addedToWatchList: false)
        }
    }
    
    private func getDate(from rawDate: String?) -> Date? {
        
        guard let rawDate = rawDate else {return nil}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return dateFormatter.date(from: rawDate)
    }
}
