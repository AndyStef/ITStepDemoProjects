import UIKit

class HeroAcademy {
    //lazy var complexMathCalculation = Int(pow(10 + 100 - 20, 10 + 100 - 20))
    
    static var heroes: [Hero] {
        return [
            Hero(power: 16, name: "Hawkeye", image: "Hawkeye"),
            Hero(power: 5, name: "Falcon", image: "Falcon"),
            Hero(power: 86, name: "Iron Man", image: "IronMan"),
            Hero(power: 24, name: "Black Widow", image: "BlackWidow"),
            Hero(power: 64, name: "Thor", image: "Thor"),
            Hero(power: 46, name: "Spider Man", image: "SpiderMan"),
            Hero(power: 37, name: "Hulk", image: "Hulk"),
            Hero(power: 76, name: "Captain America", image: "CaptainAmerica"),
        ]
    }
    
    static func generateHeroes() -> [Hero] {
        return [
            Hero(power: 16, name: "Hawkeye", image: "Hawkeye"),
            Hero(power: 5, name: "Falcon", image: "Falcon"),
            Hero(power: 86, name: "Iron Man", image: "IronMan"),
            Hero(power: 24, name: "Black Widow", image: "BlackWidow"),
            Hero(power: 64, name: "Thor", image: "Thor"),
            Hero(power: 46, name: "Spider Man", image: "SpiderMan"),
            Hero(power: 37, name: "Hulk", image: "Hulk"),
            Hero(power: 76, name: "Captain America", image: "CaptainAmerica"),
        ]
    }
}

class Hero {
    let name: String
    private var power: Int {
        didSet {
            print("Power was changed to \(power)")
        }
    }
    var image: String
    
    var publicPower: Int {
        return power
    }
    
    init(power: Int, name: String, image: String) {
        self.name = name
        self.power = power
        self.image = image
    }
    
    func drinkPotion(_ potion: Potion) {
        switch potion {
        case .superPower:
            power += 30
            
        case .placebo:
            power += 5
            
        case .poison:
            power -= 50
        }
    }
}

enum Potion: String {
    case superPower
    case poison
    case placebo = "Placebo"
    
    var name: String {
        switch self {
        case .placebo:
            return "Placebo"
        case .poison:
            return "Poison"
        case .superPower:
            return "Super power"
        }
    }
}

let ironMan = Hero(power: 85, name: "Iron Man", image: "IronMan")
let captainAmerica = Hero(power: 50, name: "Captain America", image: "CaptainAmerica")

ironMan.drinkPotion(.superPower)
print(ironMan.publicPower)

ironMan.drinkPotion(.poison)
print(ironMan.publicPower)

//ironMan.power = 40

let poison = Potion.poison
poison.rawValue

let heroes = HeroAcademy.heroes

for hero in heroes {
    print(hero.name)
}

let academy = HeroAcademy()

// let value = academy.complexMathCalculation
