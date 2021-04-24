//
//  DatabaseService.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 24.04.2021.
//

import Foundation

protocol DatabaseService {
    func save(object: DatabaseObject)
    func update(block: @escaping () -> Void)
    func delete(object: DatabaseObject)
    func deleteAll<T: DatabaseObject>(_ model: T.Type)
    func fetch<T: DatabaseObject>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> [T]
}
