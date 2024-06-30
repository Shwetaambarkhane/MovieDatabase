//
//  CategoryList.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 30/06/24.
//

import Foundation
import SwiftUI

struct CategoryList: View {
    var options: [String]
    var movies: [Movie]
    
    var body: some View {
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
        default:
            return []
        }
    }
}
