//
//  JSONLoader.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 29/06/24.
//

import Foundation

struct JSONLoader {
    func loadMovies() -> [MovieData] {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        let decoder = JSONDecoder()
        return (try? decoder.decode([MovieData].self, from: data)) ?? []
    }
}
