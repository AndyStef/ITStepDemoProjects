//
//  Movie.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//

import Foundation
import UIKit

struct Movie {
    let id: Int
    let name: String
    let description: String
    let image: String
    var rating: Double
    let releaseDate: Date
    let isFavourite: Bool
    let duration: Int
}
