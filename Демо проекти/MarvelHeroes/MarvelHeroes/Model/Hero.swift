//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Andy Stef on 18.02.2021.
//

import Foundation

class Hero {
    
    let name: String
    let power: Int
    let image: String
    let team: Team
    
    init(power: Int, name: String, image: String, team: Team) {
        self.name = name
        self.power = power
        self.image = image
        self.team = team
    }
}
