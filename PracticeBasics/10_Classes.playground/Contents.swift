import UIKit

// MARK: - Creating your own classes
/// No memberwise initialiser

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// Finito: 10/12 perché fare le cose tardi alla sera quando sei stanco non va bene

// MARK: - Class Inheritance
/// Create a class based on an existing class

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
/// `super.init` is always required for child classes.
// 1. perché Cristo questo è sbagliato?
class Vehicle {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}
class Truck: Vehicle {
    var goodsCapacity: Int
    init(wheels: Int, goodsCapacity: Int) {
        self.goodsCapacity = goodsCapacity
        super.init(wheels: wheels) // mancava il parametro nell'initialiser
    }
}

// Finito: 10/12

// MARK: - Overriding methods
class BarkingDog {
    func makeNoise() {
        print("Woof!")
    }
}

class BarkingPoodle: BarkingDog {
    override func makeNoise() {
        print("Yip!")
    }
}

let thePoppy = BarkingPoodle()
thePoppy.makeNoise()

// Finito: 10/12 ... sempre la stessa distrazione di merda.

// MARK: - Final classes
final class TheDog {
    var name: String
    var breed: String
       
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Finito: 12/12

// MARK: - Copying objects
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

// Finito: 11/12 perché sei un fenomeno ...

// MARK: - Deinitialisers
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Finito: 11/12 perché sei un cretino...

// MARK: - Mutability
class MutSinger {
    var name = "Taylor Swift"
}

let taylor = MutSinger()
taylor.name = "Ed Sheeran"
print(taylor.name)

// Finito: 9/12 perché sei stanco Dio Cane!
