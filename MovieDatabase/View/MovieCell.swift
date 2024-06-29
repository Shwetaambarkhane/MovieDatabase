//
//  MovieCell.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        // Movie cell view
        HStack {
            AsyncImage(url: URL(string: movie.poster))
                .frame(width: 75, height: 75)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.movieData.Language)
                    .font(.subheadline)
                Text("\(movie.year)")
                    .font(.subheadline)
            }
        }
    }
}
