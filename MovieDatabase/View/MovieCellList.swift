//
//  MovieCellList.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 30/06/24.
//

import SwiftUI

struct MovieCellList: View {
    var movies: [Movie]
    
    var body: some View {
        ForEach(movies) { movie in
            NavigationLink(
                destination: MovieDetailView(movie: movie)) {
                    MovieCell(movie: movie)
                }
        }
    }
}
