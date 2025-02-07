//
//  MoviesListView.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject private var viewModel: MoviesViewModel

    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
            NavigationView {
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
    
    func callNextPageIfApplicable(movie: Movie) {
        if let lastYear = viewModel.groupedMovies.keys.sorted(by: >).last,
           let lastMovie = viewModel.groupedMovies[lastYear]?.last,
           movie.id == lastMovie.id {
            Task {
                await viewModel.loadMovies()
            }
        }
    }
}

//#Preview {
//    MoviesListView(viewModel: MoviesViewModel(getMoviesUseCase: GetMoviesUseCaseImpl(repository: MovieRepositoryImpl(remoteDataSource: MoviesRemoteDataSource()))))
//}
