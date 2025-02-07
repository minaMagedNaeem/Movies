//
//  MovieDetailsTabBarViewController.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import UIKit

class MovieDetailsTabBarViewController: UITabBarController {
    
    private let movieDetailsViewModel: MovieDetailsViewModel
    
    init(movieDetailsViewModel: MovieDetailsViewModel) {
        self.movieDetailsViewModel = movieDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        tabBarController?.tabBar.tintColor = AppColors.primary
        
        let movieDetailsVC = MovieDetailsViewController(viewModel: movieDetailsViewModel)
        movieDetailsVC.tabBarItem = UITabBarItem(title: "Details", image: UIImage(systemName: "info.circle"), tag: 0)
        movieDetailsViewModel.getMovieDetailsDelegate = movieDetailsVC

//            // Similar Movies Tab
//            let similarMoviesVC = SimilarMoviesViewController(viewModel: similarMoviesViewModel)
//            similarMoviesVC.tabBarItem = UITabBarItem(title: "Similar", image: UIImage(systemName: "film"), tag: 1)
//
//            // Movie Cast Tab
//            let castVC = MovieCastViewController(viewModel: castViewModel)
//            castVC.tabBarItem = UITabBarItem(title: "Cast", image: UIImage(systemName: "person.3"), tag: 2)

            // Add view controllers to tab bar
        viewControllers = [movieDetailsVC]//, similarMoviesVC, castVC]
        }

}
