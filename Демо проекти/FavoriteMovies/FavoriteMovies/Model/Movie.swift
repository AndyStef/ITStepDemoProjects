//
//  Movie.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//


import RealmSwift
import Foundation

@objcMembers
class Movie: Object {
    dynamic var id: Int = 1
    dynamic var name: String = ""
    dynamic var descriptionText: String = ""
    dynamic var image: String = ""
    dynamic var rating: Double = 0.0
    dynamic var releaseDate: Date = .init()
    dynamic var isFavourite: Bool = false
    dynamic var duration: Int = 0
    
    convenience init(
        id: Int,
        name: String,
        descriptionText: String,
        image: String,
        rating: Double,
        releaseDate: Date,
        isFavourite: Bool,
        duration: Int
    ) {
        self.init()
        
        self.id = id
        self.name = name
        self.descriptionText = descriptionText
        self.image = image
        self.rating = rating
        self.releaseDate = releaseDate
        self.isFavourite = isFavourite
        self.duration = duration
    }
}
