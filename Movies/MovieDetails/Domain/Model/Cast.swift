//
//  Cast.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

class Cast {
    let id: Int
    let knownForDepartment: Department?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let department: Department?
    
    init(id: Int,
         knownForDepartment: Department?,
         name: String?,
         originalName: String?,
         popularity: Double?,
         profilePath: String?,
         department: Department?) {
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.department = department
    }
}
