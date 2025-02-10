//
//  CastResponseMapper.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

import Foundation

class CastResponseMapperImpl: CastResponseMapper {
    func map(from castResponseDTO: CastResponseDTO) -> CastInfo {
        let cast = castResponseDTO.cast.map { cast in
            getCast(from: cast)
        }
        
        let crew = castResponseDTO.crew.map { crew in
            getCast(from: crew)
        }
        
        return CastInfo(cast: cast, crew: crew)
    }
    
    private func getCast(from cast: CastDTO) -> Cast {
        return Cast(id: cast.id,
                    knownForDepartment: cast.department,
                    name: cast.name,
                    originalName: cast.originalName,
                    popularity: cast.popularity,
                    profilePath: cast.profilePath,
                    department: cast.department)
    }
}
