//
//  MoviesDataSource.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//

import Foundation

protocol MoviesDataSource {
    func getMovies() -> [Movie]
}
