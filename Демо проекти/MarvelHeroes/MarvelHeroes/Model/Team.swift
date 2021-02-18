//
//  Team.swift
//  MarvelHeroes
//
//  Created by Andy Stef on 18.02.2021.
//

import UIKit

enum Team {
    case ironMan
    case captainAmerica
    case neutral
    
    var image: UIImage? {
        switch self {
        case .captainAmerica:
            return UIImage(named: "teamCaptainAmerica")
    
        case .ironMan:
            return UIImage(named: "teamIronMan")
            
        case .neutral:
            return UIImage(named: "neutralTeam")
        }
    }
    
    var color: UIColor {
        switch self {
        case .captainAmerica:
            return UIColor(red: 16/255, green: 47/255, blue: 115/255, alpha: 1.0)
            
        case .ironMan:
            return UIColor(red: 232/255, green: 49/255, blue: 81/255, alpha: 1.0)
            
        case .neutral:
            return UIColor(red: 210/255, green: 204/255, blue: 161/255, alpha: 1.0)
        }
    }
}
