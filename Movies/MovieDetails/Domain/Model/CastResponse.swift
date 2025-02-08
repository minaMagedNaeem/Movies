//
//  CastResponse.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

class CastInfo {
    let cast, crew: [Cast]
    
    init(cast: [Cast], crew: [Cast]) {
        self.cast = cast
        self.crew = crew
    }
}
