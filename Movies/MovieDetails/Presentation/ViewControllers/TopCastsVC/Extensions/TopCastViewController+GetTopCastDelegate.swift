//
//  TopCastViewController+.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//

extension TopCastViewController: GetTopCastDelegate {
    func didFetchTopCast() {
        didFinishLoading()
        tableView.reloadData()
    }
    
    func didStartLoading() {
        self.tableView.startProgressAnim()
    }
    
    func didFinishLoading() {
        self.tableView.stopProgressAnim()
    }
    
    func didFailWithError(_ error: String) {
        didFinishLoading()
        self.showErrorPopup(message: error)
    }
}
