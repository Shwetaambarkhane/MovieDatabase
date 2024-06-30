//
//  MovieList.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import Foundation
import SwiftUI

struct MovieList: View {
    @State private var movies: [Movie] = {
        let moviesData = JSONLoader().loadMovies()
        return moviesData.map { Movie(data: $0) }
    }()
    
    @State private var searchText: String = ""
    
    let options = ["Year", "Genre", "Directors", "Actors", "All Movies"]
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { movie in
                movie.title.lowercased().contains(searchText.lowercased()) ||
                movie.genre.joined(separator: ", ").lowercased().contains(searchText.lowercased()) ||
                movie.directors.joined(separator: ", ").lowercased().contains(searchText.lowercased()) ||
                movie.actors.joined(separator: ", ").lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar at the top
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                // List of options or filtered movies
                if searchText.isEmpty {
                    CategoryList(options: options, movies: movies)
                } else {
                    List {
                        MovieCellList(movies: filteredMovies)
                    }
                }
            }
            .navigationTitle("Movie Database")
        }
    }
}
