//
//  MovieDetailsViewController+GetMovieDetailsDelegate.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

extension MovieDetailsViewController: GetMovieDetailsDelegate {
    func didFetchMovieDetails(_ details: MovieDetails) {
        updateUI(with: details)
    }
    
    func didStartLoading() {
        scrollView.isHidden = true
        self.view.startProgressAnim()
    }
    
    func didFinishLoading() {
        scrollView.isHidden = false
        self.view.stopProgressAnim()
    }
    
    func didFailWithError(_ error: String) {
        didFinishLoading()
        self.showErrorPopup(message: error)
    }
    
    
}
