//
//  DeepLinkHandler.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import Foundation

///- Note: This Class is to be used for deeplinks. It can be easily integrated with the already created app coordinator
class DeepLinkHandler {
    static func handle(url: URL, coordinator: AppCoordinator) {
        let path = url.path
        let queryParams = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems
        
        switch path {
        case "/":
            coordinator.navigate(to: .moviesList)
        case "/movie-details":
            if let movieId = queryParams?.first(where: { $0.name == "movieId" })?.value {
                coordinator.navigate(to: .movieDetails(movieId: movieId))
            }
        default:
            print("Invalid deep link: \(url)")
        }
    }
}
