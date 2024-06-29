//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var selectedRatingSource: String = "IMDB"
    
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(named: movie.poster)!)
                    .resizable()
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
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
        .navigationTitle(movie.title)
    }
}
