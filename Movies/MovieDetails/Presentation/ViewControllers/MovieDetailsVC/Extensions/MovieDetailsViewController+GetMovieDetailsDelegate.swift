//
//  MovieDetailsViewController+GetMovieDetailsDelegate.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import Foundation

extension MovieDetailsViewController: GetMovieDetailsDelegate {
    func didFetchMovieDetails(_ details: MovieDetails) {
        updateUI(with: details)
    }
    
    func didStartLoading() {
        self.view.startProgressAnim()
    }
    
    func didFinishLoading() {
        self.view.stopProgressAnim()
    }
    
    func didFailWithError(_ error: String) {
        didFinishLoading()
        self.showErrorPopup(message: error)
    }
}
