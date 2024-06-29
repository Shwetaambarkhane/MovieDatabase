//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var selectedRatingSource: String = "Internet Movie Database"
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: movie.poster))
                    .aspectRatio(contentMode: .fit)
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(movie.plot)
                    .font(.body)
                    .padding()
                
                Text("Cast: \(movie.movieData.Actors)")
                    .font(.subheadline)
                    .padding(.vertical)
                
                Text("Director: \(movie.movieData.Director)")
                    .font(.subheadline)
                    .padding(.vertical)
                
                Text("Genre: \(movie.movieData.Genre)")
                    .font(.subheadline)
                    .padding(.vertical)
                
                Text("Release Date: \(movie.year)")
                    .font(.subheadline)
                    .padding(.vertical)
                
                Picker("Rating Source", selection: $selectedRatingSource) {
                    ForEach(movie.ratings.map { $0.Source }, id: \.self) { source in
                        Text(source).tag(source)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                RatingView(rating: movie.ratings.first { $0.Source == selectedRatingSource }?.Value ?? "N/A")
            }
        }
        .navigationTitle(movie.title)
    }
}
