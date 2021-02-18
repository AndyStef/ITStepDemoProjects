//
//  HeroAcademy.swift
//  MarvelHeroes
//
//  Created by Andy Stef on 18.02.2021.
//

import Foundation

class HeroAcademy {
    
    static func generateHeroes() -> [Hero] {
        return [
            Hero(power: 16, name: "Hawkeye", image: "Hawkeye", team: .captainAmerica),
            Hero(power: 5, name: "Falcon", image: "Falcon", team: .captainAmerica),
            Hero(power: 86, name: "Iron Man", image: "IronMan", team: .ironMan),
            Hero(power: 24, name: "Black Widow", image: "BlackWidow", team: .ironMan),
            Hero(power: 64, name: "Thor", image: "Thor", team: .neutral),
            Hero(power: 46, name: "Spider Man", image: "SpiderMan", team: .ironMan),
            Hero(power: 37, name: "Hulk", image: "Hulk", team: .neutral),
            Hero(power: 76, name: "Captain America", image: "CaptainAmerica", team: .captainAmerica),
        ]
    }
}
