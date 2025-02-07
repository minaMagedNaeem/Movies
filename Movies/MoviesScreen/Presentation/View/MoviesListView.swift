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

    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
            NavigationView {
                VStack {
                    TextField("Search movies...", text: $searchText)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                        .onChange(of: searchText) { newValue in
                                            debounceSearch(keyword: newValue)
                                        }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(viewModel.groupedMovies.keys.sorted(by: >), id: \.self) { year in
                                Section(header: Text(String(year))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .padding(.top, 8)
                                ) {
                                    ForEach(viewModel.groupedMovies[year] ?? [], id: \.id) { movie in
                                        MovieRow(movie: movie)
                                            .onAppear {
                                                callNextPageIfApplicable(movie: movie)
                                        }
                                    }
                                }
                            }

                            if viewModel.isLoading {
                                ProgressView("Loading more...")
                                    .padding()
                            } else if let error = viewModel.errorMessage {
                                Text(error)
                                    .foregroundColor(.red)
                                    .padding()
                            } else if viewModel.movies.isEmpty {
                                Text("No movies found")
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Movies")
                    .onAppear {
                        Task {
                            await viewModel.loadMovies()
                        }
                    }
                }
            }
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
