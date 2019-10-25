import SwiftUI

// MARK: - Creating your own structs
// 4. strano, questo è valido
struct User {
    var name = "Anonymous"
    var age: Int
}
let twostraws = User(name: "Paul", age: 38)
//User(age: <#T##Int#>)
//User(name: <#T##String#>, age: <#T##Int#>)
// avendo un default non sono obbligato ad utilizzarlo nell'initialiser

// FINITO: 11/12 in 5:13

// MARK: - Computed properties
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// 3. esempio errato
//struct Candle {
//    var burnLength: Int
//    var alreadyBurned = 0
//    let burnRemaining: Int { // let declarations cannot be computed properties
//        return burnLength - alreadyBurned
//    }
//}

// Computed properties must RETURN values, not PRINT them
// FINITO: solo 9/12 in 7:00

// MARK: - Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
// We cannot attach a property observer to a constant!!!
// FINITO: di nuovo 9/12 per distrazione in 4:39

// MARK: - Methods
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
// FINITO: 12/12 in 2:15

// MARK: - Mutating methods
// FINITO: 11/ 12 in 4:33

// MARK: - Properties and methods of string
// FINITO: 6/6 in 2:44

// MARK: - Properties and methods of arrays
// FINITO: 10/12 in 2:54
