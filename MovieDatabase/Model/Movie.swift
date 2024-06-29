//
//  Movie.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import Foundation

struct Movie: Identifiable, Hashable {
    
    var id: String {
        return UUID().uuidString
    }
    var movieData: MovieData
    let title: String
    let year: String
    let genre: [String]
    let directors: [String]
    let actors: [String]
    let languages: [String]
    let poster: String
    let plot: String
    let ratings: [Rating]
    
    init(data: MovieData) {
        movieData = data
        
        title = movieData.Title
        year = movieData.Year
        genre = movieData.Genre.components(separatedBy: ", ")
        directors = movieData.Director.components(separatedBy: ", ")
        actors = movieData.Actors.components(separatedBy: ", ")
        languages = movieData.Language.components(separatedBy: ", ")
        poster = movieData.Poster
        plot = movieData.Plot
        ratings = movieData.Ratings
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
