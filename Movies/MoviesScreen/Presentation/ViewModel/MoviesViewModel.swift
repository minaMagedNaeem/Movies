//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import SwiftUI

@MainActor
class MoviesViewModel: ObservableObject {
    private let getMoviesUseCase: GetMoviesUseCase
    private let searchMoviesUseCase: SearchMoviesUsecase
    private let coordinator: Coordinator

    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentPage = 1
    private var hasMoreMovies = true
    private var currentKeyword: String?
    
    init(getMoviesUseCase: GetMoviesUseCase, searchMoviesUseCase: SearchMoviesUsecase, coordinator: Coordinator) {
        self.getMoviesUseCase = getMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
        self.coordinator = coordinator
    }

    var groupedMovies: [Int: [Movie]] {
        Dictionary(grouping: movies, by: { getYear(from: $0.releaseDate) })
    }

    func loadMovies() async {
        guard !isLoading, hasMoreMovies else { return }

        isLoading = true
        errorMessage = nil

        do {
            var newMovies: [Movie]
            
            if currentKeyword?.isEmpty == true || currentKeyword == nil {
                newMovies = try await getMoviesUseCase.execute(page: currentPage)
            } else {
                newMovies = try await searchMoviesUseCase.execute(page: currentPage, keyword: currentKeyword ?? "")
            }
            
            if newMovies.isEmpty {
                hasMoreMovies = false
            } else {
                movies.append(contentsOf: newMovies)
                currentPage += 1
            }
        } catch {
            errorMessage = "Failed to load movies: \(error.localizedDescription)"
        }

        isLoading = false
    }
    
    func searchMovies(keyword: String) async {
        currentPage = 1
        hasMoreMovies = true
        movies.removeAll()
        
        currentKeyword = keyword
        
        await loadMovies()
    }
    
    func goToDetails(of movie: Movie) {
        coordinator.navigate(to: .movieDetails(movie: movie))
    }
    
    private func getYear(from date: Date?) -> Int {
        
        guard let date = date else {return 0} //0 to put it at the end of the list
        
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
}
