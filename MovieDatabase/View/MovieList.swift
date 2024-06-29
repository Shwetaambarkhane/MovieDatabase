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
    @State private var selectedMovie: Movie?
    
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
                    List {
                        ForEach(options, id: \.self) { option in
                            Section(header: Text(option)) {
                                    ForEach(getValues(for: option), id: \.self) { value in
                                        Text(value)
                                            .onTapGesture {
                                                // Show list of movies for the selected value
                                                print("hello1", value)
                                            }
                                    }
                            }
                        }
                    }
                    .listStyle(.sidebar)
                } else {
                    List(filteredMovies, selection: $selectedMovie) { movie in
                        MovieCell(movie: movie)
                    }
                }
            }
            .navigationTitle("Movie Database")
        }
    }
    
    func getValues(for option: String) -> [String] {
        switch option {
        case "Year":
            return Array(Set(movies.map { "\($0.year)" })).sorted()
        case "Genre":
            return Array(Set(movies.flatMap { $0.genre })).sorted()
        case "Directors":
            return Array(Set(movies.flatMap { $0.directors })).sorted()
        case "Actors":
            return Array(Set(movies.flatMap { $0.actors })).sorted()
        case "All Movies":
            return movies.map { $0.title }
        default:
            return []
        }
    }
}
