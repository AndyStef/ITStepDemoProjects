//
//  MoviesFactory.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//

import Foundation

class MoviesFactory: MoviesDataSource {
    
    func getMovies() -> [Movie] {
        return [
            Movie(
                id: 1,
                name: "Avengers Endgame",
                descriptionText: "",
                image: "EndGame",
                rating: 4.8,
                releaseDate: Date(timeIntervalSince1970: 1556171226),
                isFavourite: true,
                duration: 162
            ),
            Movie(
                id: 2,
                name: "Birds Of Prey",
                descriptionText: "",
                image: "Birds",
                rating: 3.2,
                releaseDate: Date(),
                isFavourite: false,
                duration: 102
            ),
            Movie(
                id: 3,
                name: "Spiderman Far From Home",
                descriptionText: "",
                image: "Spider",
                rating: 4.5,
                releaseDate: Date(),
                isFavourite: true,
                duration: 102
            ),
            Movie(
                id: 4,
                name: "Star Wars Rise of Skywalker",
                descriptionText: "",
                image: "StarWars",
                rating: 4.1,
                releaseDate: Date(),
                isFavourite: true,
                duration: 102
            ),
        ]
    }
}
