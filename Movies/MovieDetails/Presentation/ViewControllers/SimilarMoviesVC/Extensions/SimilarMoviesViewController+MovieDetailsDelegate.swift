//
//  Untitled.swift
//  Movies
//
//  Created by Mina Maged on 08/02/2025.
//

extension SimilarMoviesViewController: GetSimilarMoviesDelegate {
    func didFetchSimilarMovies() {
        collectionView.reloadData()
    }
    
    func didStartLoading() {
        self.collectionView.startProgressAnim()
    }
    
    func didFinishLoading() {
        self.collectionView.stopProgressAnim()
        self.collectionView.layoutIfNeeded()
    }
    
    func didFailWithError(_ error: String) {
        didFinishLoading()
        self.showErrorPopup(message: error)
    }
    
    
}
