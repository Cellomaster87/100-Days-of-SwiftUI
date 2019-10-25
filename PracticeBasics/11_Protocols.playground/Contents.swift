import UIKit

// MARK: - Protocols
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

/// It is not possible to create set-only properties in Swift
/// Properties must have { get } or { get set } after them.
/// Finito: 11/12

// MARK: - Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }
/// Empty protocols must have braces anyway
/// Finito: 9/12, male perché non leggi le cose

// MARK: - Extensions
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()
/// No stored property allowed in extensions, only _computed properties_!
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0 ..< self {
            action()
        }
    }
}

extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        }
        return "\(prefix)\(self)"
    }
}

extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}

/// Disastro, 7/12

// MARK: - Protocol extension
/// Protocol extensions extend a whole protocol so that all conforming types get your changes.
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul","George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()
/// Meglio: 12/12

// MARK: - Protocol-Oriented Programming
protocol IsIdentifiable {
    var id: String { get set }
    func identify()
}

extension IsIdentifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct Userr: IsIdentifiable {
    var id: String
}

let twostraws = Userr(id: "twostraws")
twostraws.identify()
/// Bene: 6/6

// MARK: - Protocol and extensions summary
/// 1. Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
/// 2. You can build protocols on top of other protocols, similar to classes.
/// 3. Extensions let you add methods and computed properties to specific types such as Int.
/// 4. Protocol extensions let you add methods and computed properties to protocols.
/// 5. Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations

protocol HasAge {
    var age: Int { get set }
    mutating func celebrateBirthday()
}

/// OK: 8/12 ...
