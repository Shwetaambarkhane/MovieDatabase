//
//  RatingView.swift
//  MovieDatabase
//
//  Created by Shweta Ambarkhane on 30/06/24.
//

import SwiftUI

struct RatingView: View {
    let rating: String
    
    var body: some View {
        Text(rating)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}
