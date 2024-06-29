//
//  MovieFilteredList.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 30/06/24.
//

import SwiftUI

struct MovieFilteredList: View {
    var movies: [Movie]
    var attribute: String
    
    var body: some View {
        List {
            MovieCellList(movies: movies)
        }
        .navigationTitle(attribute)
    }
}
