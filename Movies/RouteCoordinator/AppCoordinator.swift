//
//  AppCoordinator.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigate(to: .moviesList)
    }
    
    func navigate(to route: AppRoute) {
        switch route {
        case .moviesList:
            break
//            let moviesListVC = MoviesListViewController()
//            navigationController.setViewControllers([moviesListVC], animated: false)
        case .movieDetails(movieId: let movieId):
            break
//            let movieDetailsVC = MovieDetailsViewController(movieId: movieId)
//            navigationController.pushViewController(movieDetailsVC, animated: true)
        }
    }
    
    
}
