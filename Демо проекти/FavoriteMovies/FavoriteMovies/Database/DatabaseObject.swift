//
//  DatabaseObject.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 24.04.2021.
//

import RealmSwift

/*
 Abstrac object for any types of objects that should be stored inside database storage
 */
protocol DatabaseObject {}

extension Object: DatabaseObject {}
