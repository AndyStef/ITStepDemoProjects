//
//  RealmDatabase.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 24.04.2021.
//

import Realm
import RealmSwift

class RealmDatabase: DatabaseService {
    
    private let realm = try! Realm()
    
    private func safeWrite(_ block: (() throws -> Void)) {
        if realm.isInWriteTransaction {
            try? block()
        } else {
            try? realm.write(block)
        }
    }
    
    func save(object: DatabaseObject) {
        safeWrite {
            realm.add(object as! Object)
        }
    }
    
    func update(block: @escaping () -> Void) {
        safeWrite {
            block()
        }
    }
    
    func delete(object: DatabaseObject) {
        safeWrite {
            realm.delete(object as! Object)
        }
    }
    
    func deleteAll<T>(_ model: T.Type) where T : DatabaseObject {
        let model = model as! Object.Type
        safeWrite {
            let objects = realm.objects(model)
            objects.forEach {
                realm.delete($0)
            }
        }
    }
    
    func reset() throws {
        safeWrite {
            realm.deleteAll()
        }
    }
    
    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?) -> [T] where T : DatabaseObject {
        guard let model = model as? Object.Type else {
            return []
        }

        var objects = realm.objects(model)

        if let predicate = predicate {
            objects = objects.filter(predicate)
        }

        if let sorted = sorted {
            objects = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }

        return objects.compactMap { $0 as? T }
    }
}
