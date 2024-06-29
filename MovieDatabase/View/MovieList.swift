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
                                if option != "All Movies" {
                                    ForEach(getValues(for: option), id: \.self) { value in
                                        NavigationLink(
                                            destination: MovieFilteredList(movies: getFilteredMovies(with: value, option: option), attribute: option)) {
                                                Text(value)
                                            }
                                    }
                                } else {
                                    MovieCellList(movies: movies)
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
    
    func getFilteredMovies(with value: String, option: String) -> [Movie] {
        return movies.filter { movie in
            getAttribute(from: movie, option: option).lowercased().contains(value.lowercased())
        }
    }
    
    func getAttribute(from movie: Movie, option: String) -> String {
        switch option {
        case "Year":
            return movie.year
        case "Genre":
            return movie.movieData.Genre
        case "Directors":
            return movie.movieData.Director
        case "Actors":
            return movie.movieData.Actors
        default:
            return ""
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
