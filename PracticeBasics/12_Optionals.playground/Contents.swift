import UIKit

// MARK: - Handling missing data
var age: Int? = nil
age = 38

/// Good candidates for optionals: capital cities, someone's birthday (if you know it), the year someone has gone on a boat, the current destination of a satellite navigation system, someone's middle name, the position of an item in an array.
/// Finito: 5/6

// MARK: - Unwrapping optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

/// Finito: 11/12

// MARK: - Unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}

// 1. quasi un minuto per capire questo esempio...
func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5
if let doubled = double(number: input) {
    print("\(input) doubled is \(doubled).")
}

/// Finito: 11/12

// MARK: - Force unwrapping
let str = "5"
let num = Int(str)!

/// Finito: 6/6

// MARK: - Implicitly unwrapped optionals
let impUnwAge: Int! = nil

/// Finito: 6/6

// MARK: - Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

/// Finito: 11/12

// MARK: - Optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

// Finito: 11/12

// MARK: - Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")

/// Finito: 6/6

// MARK: - Failable initializers
struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

/// Finito: 10/12 perché sono cotto.

// MARK: - Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

/// Finito: 10/12 ... sbagliato gli ultimi due perché sono fuso

// MARK: - Optionals summary
/// 1. Optionals let us represent the absence of a value in a clear and unambiguous way.
/// 2. Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
/// 3. You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
/// 4. Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
/// 5. You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
/// 6. Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
/// 7. You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
/// 8. If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
/// 9. You can use typecasting to convert one type of object to another.

func process(order: String) {
    print("OK, I'll get your \(order).")
}
let pizzaRequest: String! = "pizza"
process(order: pizzaRequest)

/// Finito: 10/12 pace...

