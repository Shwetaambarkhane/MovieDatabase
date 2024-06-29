//
//  MovieData.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import Foundation

struct MovieData: Decodable {
    let Title: String
    let Year: String
    let Genre: String
    let Director: String
    let Actors: String
    let Language: String
    let Poster: String
    let Plot: String
    let Ratings: [Rating]
}
