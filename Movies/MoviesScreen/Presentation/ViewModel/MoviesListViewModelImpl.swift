//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import SwiftUI

@MainActor
class MoviesListViewModelImpl: MoviesViewModel {
    private let getMoviesUseCase: GetMoviesUseCase
    private let searchMoviesUseCase: SearchMoviesUsecase
    private weak var coordinator: Coordinator?
    
    private var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let defaultPage = 1
    private var currentPage: Int
    private var hasMoreMovies = true
    private var currentKeyword: String?
    
    init(getMoviesUseCase: GetMoviesUseCase, searchMoviesUseCase: SearchMoviesUsecase, coordinator: Coordinator?) {
        self.getMoviesUseCase = getMoviesUseCase
        self.searchMoviesUseCase = searchMoviesUseCase
        self.coordinator = coordinator
        self.currentPage = defaultPage
    }
    
    public var groupedMovies: [Int: [Movie]] {
        Dictionary(grouping: movies, by: { getYear(from: $0.releaseDate) })
    }
    
    public func loadMovies() async {
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
    
    public func searchMovies(keyword: String) async {
        currentPage = defaultPage
        hasMoreMovies = true
        movies.removeAll()
        
        currentKeyword = keyword
        
        await loadMovies()
    }
    
    public func goToDetails(of movie: Movie) {
        coordinator?.navigate(to: .movieDetails(movie: movie))
    }
    
    private func getYear(from date: Date?) -> Int {
        
        guard let date = date else {return 0}
        
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
}
