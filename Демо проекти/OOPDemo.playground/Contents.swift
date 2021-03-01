import UIKit

class Restaurant {
    
    private var tables: [Table] = [
        .init(numberOfSeats: 4, state: .free),
        .init(numberOfSeats: 5, state: .free),
        .init(numberOfSeats: 6, state: .occupied),
        .init(numberOfSeats: 4, state: .occupied),
    ]
    
    func availableTable(for visitorsCount: Int) -> Table? {
        guard let table = tables.first(
            where: { $0.numberOfSeats >= visitorsCount && $0.state == .free }
        ) else {
            return nil
        }
        
        return table
    }
    
    func occupy(_ table: Table) {
        guard let tableIndex = tables.firstIndex(of: table) else {
            return
        }
        
        tables[tableIndex].state = .occupied
    }
    
    private var chef = Chef()
    
    func cook(_ dishes: [Dish]) {
        dishes.forEach { dish in
            chef.cook(dish)
        }
    }
}

class Chef {
    func cook(_ dish: Dish) {
        switch dish {
        case is Pizza:
            print("Cook Pizza")
            break
        case is Burger:
            print("Cook Burger")
            break
            
        default:
            break
        }
    }
}

struct Table: Equatable {
    var numberOfSeats: Int
    var state: TableState
}

enum TableState: Equatable {
    case free
    case reserved(time: Date)
    case occupied
}

protocol Dish {
    var price: Double { get }
    var ingradients: [Ingradient] { get set }
}

protocol Ingradient {}

struct Burger: Dish {
    
    var price: Double = 10.0
    var ingradients: [Ingradient]
}

struct Pizza: Dish {
    
    var price: Double = 13.0
    var ingradients: [Ingradient]
}

func testRestaurant() {

    let restaurant = Restaurant()
        
//    restaurant.tables[0].state = .occupied
    
//    guard let freeTableIndex = restaurant.tables.firstIndex(
//            where: { $0.numberOfSeats >= 4 && $0.state == .free }
//    ) else {
//        return
//    }
//
//    restaurant.tables[freeTableIndex].state = .occupied
    
    guard let freeTable = restaurant.availableTable(for: 4) else {
        print("You should wait, no tables available")
        return
    }
    
    restaurant.occupy(freeTable)
}

class SomeClass {
    
    private let someProperty: String
    
    init(someProperty: String) {
        self.someProperty = someProperty
    }
    
    func someFunc() {
        print("Do some work")
    }
}

final class Subclass: SomeClass {
    
    let anotherProperty: Int
    
    init(someProperty: String, anotherProperty: Int) {
        self.anotherProperty = anotherProperty
        
        super.init(someProperty: someProperty)
    }
    
    override func someFunc() {
        super.someFunc()
        
        //print(someProperty)
        print("Do some subclass work")
    }
    
    func anotherFunc() {
        print("This is subclass function")
    }
}

//class Animal {
//
//    func move() {
//        print("Base class movement")
//    }
//}
//
//class Mammal: Animal {
//
//    override func move() {
//        print("Moving with paws")
//    }
//}
//
//class Bird: Animal {
//
//    override func move() {
//        print("Flying")
//    }
//}
//
//class Fish: Animal {
//
//    override func move() {
//        print("Swimming")
//    }
//}
//
//let animals = [Fish(), Bird(), Mammal(), Mammal()]
//
//for animal in animals {
//    animal.move()
//}

protocol Animal {
    func move()
}

protocol CanFly {
    var wingsLenght: Double { get }
    
    func fly()
}

protocol CanSwim {
    func swim()
}

class Bird: Animal, CanFly {
    
    var wingsLenght: Double
    
    init(wingsLenght: Double = 1.2) {
        self.wingsLenght = wingsLenght
    }
    
    func move() {
        fly()
    }
    
    func fly() {
        print("I'm flying")
    }
}

class Fish: Animal, CanSwim {
    
    func move() {
        swim()
    }
    
    func swim() {
        print("Swimming in the see")
    }
}

let animals: [Animal] = [Fish(), Bird(), Bird(), Bird(), Fish()]

for animal in animals {
    animal.move()
    
    if let bird = animal as? Bird {
        bird.fly()
    }
    
    if let fish = animal as? Fish {
        fish.swim()
    }
}
