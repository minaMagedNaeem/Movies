//
//  AppCoordinator.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import UIKit

class AppCoordinator: @preconcurrency Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor func start() {
        navigate(to: .moviesList)
    }
    
    @MainActor func navigate(to route: AppRoute) {
        switch route {
        case .moviesList:
            let moviesListVC = MoviesListFactory.get(coordinator: self)
            navigationController.setViewControllers([moviesListVC], animated: false)
        case .movieDetails(movie: let movie):
            
            let movieDetailsTabBarVC = MovieDetailsScreenFactory.get(movie: movie, coordinator: self)
            
            navigationController.pushViewController(movieDetailsTabBarVC, animated: true)
        }
    }
}
