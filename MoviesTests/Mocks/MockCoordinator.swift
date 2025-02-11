//
//  MockCoordinator.swift
//  Movies
//
//  Created by Mina Maged on 11/02/2025.
//

import XCTest
@testable import Movies

class MockCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //do nothing
    }
    
    func navigate(to route: Movies.AppRoute) {
        //do nothing
    }
}
