//
//  MoviesListViewModelP.swift
//  Movies
//
//  Created by Mina Maged on 10/02/2025.
//
import SwiftUI

@MainActor
protocol MoviesViewModel: ObservableObject {
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    var groupedMovies: [Int: [Movie]] { get }
    
    func loadMovies() async
    func searchMovies(keyword: String) async
    func goToDetails(of movie: Movie)
}
