//
//  CastResponseMapper.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import Foundation

class CastResponseMapper {
    static func map(from castResponseDTO: CastResponseDTO) -> CastInfo {
        
        let cast = castResponseDTO.cast.map { cast in
            Cast(id: cast.id,
                 knownForDepartment: cast.department,
                 name: cast.name,
                 originalName: cast.originalName,
                 popularity: cast.popularity,
                 profilePath: cast.profilePath,
                 department: cast.department)
        }
        
        let crew = castResponseDTO.crew.map { crew in
            Cast(id: crew.id,
                 knownForDepartment: crew.department,
                 name: crew.name,
                 originalName: crew.originalName,
                 popularity: crew.popularity,
                 profilePath: crew.profilePath,
                 department: crew.department)
        }
        
        return CastInfo(cast: cast, crew: crew)
    }
}
