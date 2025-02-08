//
//  MovieRow.swift
//  Movies
//
//  Created by Mina Maged on 07/02/2025.
//
import SwiftUI
import Kingfisher

struct MovieRow: View {
    @ObservedObject var movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let posterPath = movie.posterPath {
                KFImage(URL(string: "\(IMAGESBASEURL)\(posterPath)"))
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 3)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title ?? "Movie name not available")
                    .titleFont() // Applies custom title font

                Text(movie.overview ?? "Movie overview not available")
                    .accentFont() // Uses accent font for the overview
                    .foregroundColor(.secondary)
                    .lineLimit(nil)

                HStack {
                    Image(systemName: movie.addedToWatchlist ? "bookmark.fill" : "bookmark")
                        .foregroundColor(movie.addedToWatchlist ? .yellow : .gray)
                    Text(movie.addedToWatchlist ? "On Watchlist" : "Not in Watchlist")
                        .font(.custom(AppFont.bodyFont, size: 14)) // Uses body font
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    MovieRow(movie: Movie(id: 123, originalLanguage: "English", originalTitle: "Test Movie", overview: "text test tst test test test test test test test", posterPath: "/1se0w1IwJj7APH94qwbnmgnHjI.jpg", releaseDate: MoviesMapper.getDate(from: "2000-07-25"), title: "Some Movie", addedToWatchList: true))
//}
