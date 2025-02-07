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

    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var currentPage = 1
    private var hasMoreMovies = true
    
    init(getMoviesUseCase: GetMoviesUseCase) {
            self.getMoviesUseCase = getMoviesUseCase
    }

    var groupedMovies: [Int: [Movie]] {
        Dictionary(grouping: movies, by: { getYear(from: $0.releaseDate) })
    }

    func loadMovies() async {
        guard !isLoading, hasMoreMovies else { return }

        isLoading = true
        errorMessage = nil

        do {
            let newMovies = try await getMoviesUseCase.execute(page: currentPage)
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
    
    private func getYear(from date: Date?) -> Int {
        
        guard let date = date else {return 0} //0 to put it at the end of the list
        
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
}
