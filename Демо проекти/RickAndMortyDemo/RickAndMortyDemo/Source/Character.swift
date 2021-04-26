//
//  Character.swift
//  RickAndMortyDemo
//
//  Created by Andy Stef on 05.11.2020.
//

import Foundation

// Need to add Codable to work with JSON
// keys should match or it require more work
class CharactersResults: Codable {
    var results: [Character] = []
}

class Character: Codable {
    var name: String = ""
    var image: String = ""
}
