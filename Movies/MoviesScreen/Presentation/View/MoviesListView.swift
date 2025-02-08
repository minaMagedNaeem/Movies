//
//  MoviesListView.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel: MoviesViewModel
    @State private var searchText = ""
    @State private var searchTask: DispatchWorkItem?
    @State private var hasAppeared = false

    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                searchBar
                contentView
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { // Avoids oversized title
                    Text("Movies")
                        .titleFont()
                        .foregroundColor(.primary)
                }
            }
            .onAppear {
                            if !hasAppeared {
                                hasAppeared = true
                                Task {
                                    await viewModel.loadMovies()
                                }
                            }
                        }
        }
    }

    // MARK: - Search Bar
    private var searchBar: some View {
        TextField("Search movies...", text: $searchText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .onChange(of: searchText) { newValue in
                debounceSearch(keyword: newValue)
            }
    }

    // MARK: - Content View (Loading, Empty States, or Movie List)
    @ViewBuilder
    private var contentView: some View {
        if viewModel.isLoading {
            loadingView
        } else if viewModel.movies.isEmpty {
            emptyStateView
        } else {
            movieListView
        }
    }

    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView {
                Text("Loading...").accentFont()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var emptyStateView: some View {
        VStack {
            Spacer()
            Text(searchText.isEmpty ? "No movies available" : "No search results found")
                .foregroundColor(.gray)
                .accentFont()
            Spacer()
        }
    }

    private var movieListView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ForEach(viewModel.groupedMovies.keys.sorted(by: >), id: \.self) { year in
                    Section(header: sectionHeader(for: year)) {
                        ForEach(viewModel.groupedMovies[year] ?? [], id: \.id) { movie in
                            MovieRow(movie: movie)
                                .onAppear {
                                    callNextPageIfApplicable(movie: movie)
                                }
                                .onTapGesture {
                                    viewModel.goToDetails(of: movie)
                                }
                        }
                    }
                }
            }
            .padding()
        }
    }

    private func sectionHeader(for year: Int) -> some View {
        Text(String(year))
            .titleFont()
            .padding(.top, 8)
    }

    private func callNextPageIfApplicable(movie: Movie) {
        if let lastYear = viewModel.groupedMovies.keys.sorted(by: >).last,
           let lastMovie = viewModel.groupedMovies[lastYear]?.last,
           movie.id == lastMovie.id {
            Task {
                await viewModel.loadMovies()
            }
        }
    }

    private func debounceSearch(keyword: String) {
        searchTask?.cancel()

        let task = DispatchWorkItem {
            Task {
                await viewModel.searchMovies(keyword: keyword)
            }
        }

        searchTask = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
    }
}



//#Preview {
//    MoviesListView(viewModel: MoviesViewModel(getMoviesUseCase: GetMoviesUseCaseImpl(repository: MovieRepositoryImpl(remoteDataSource: MoviesRemoteDataSource()))))
//}
