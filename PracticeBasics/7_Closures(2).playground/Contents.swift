import UIKit

// MARK: - Using closures as parameters when they accept parameters
// 1.
func login(then action: (String) -> Void) {
    print("Authenticating...")
    let username = "twostraws"
    action(username)
}
//
//login {
//    print("Welcome, \(username)!")
//}


// 2.
func fetchData(then parse: (String) -> Void) {
    let data = "Success!"
    parse(data)
}
fetchData { (data: String) in
    print("Data received: \(data)")
}

// 3. was wrong
// queste closures permettono ogni volta che chiamiamo la funzione
// di specificare un diverso comportamento, sebbene specificando in anticipo
// il valore del parametro. Interessante.

// 4.
func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in // occorre dare un nome al parametro
    print("You want $\(bill) for that? Outrageous!")
}

// 5. was easy ...
// 6., 7. were wrong
// 8.
func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}

// 9. was easy
// 10. why this is wrong? Double was not placed inside parentheses.
func getMeasurement(handler: (Double) -> Void) {
    let measurement = 32.2
    handler(measurement)
}
getMeasurement { (measurement: Double) in
    print("It measures \(measurement).")
}

// 30 minutes to get the first test right...

// MARK: - Using closures as parameters when they return values
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car."
}

// 4. esempio interessante
func loadData(input: () -> String) {
    print("Loading...")
    let str = input()
    print("Loaded: \(str)")
}
loadData {
    return "He thrusts his fists against the posts"
}

// 5. pensavo mancasse la type declaration e ho messo che non andava bene
func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}
manipulate(numbers: [1, 2, 3]) { (number: Int) -> Int in // questa sarebbe la versione estesa
    return number * number
}

// 6. anche questo era corretto
func encrypt(password: String, using algorithm: (String) -> String) {
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is \(result)")
}
encrypt(password: "t4ylor") { (password: String) in // mi sembra che manchi qualcosa ed invece è giusto
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}
encrypt(password: "t4ylor") { (password: String) -> String in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}
encrypt(password: "t4ylor") { password in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}

// 10. ma perché questo è giusto?
func increaseBankBalance(start: Double, interestCalculator: () -> Double) {
    print("Your current balance is \(start).")
    let interestRate = interestCalculator()
    let withInterest = start * interestRate
    print("You now have \(withInterest).")
}
increaseBankBalance(start: 200.0) {
    return 1.01
}

// FINITO: 8/12 in 20:13

// MARK: - Shorthand parameter names
travel {
    "I'm going to \($0) in my car"
}

// FINITO: 6/6 in 3:51

// MARK: - Closures with multiple parameters
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at ($1) miles per hour"
}

// FINITO: 11/12 in 5:21

// MARK: - Returning closures from functions
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")
let result2 = travel()("London") // not recommended.

// 1. esempio corretto
func createValidator() -> (String) -> Bool {
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}
let validator = createValidator()
print(validator("twostraws"))

// 3. esempio corretto
func createTravelMethod(distance: Int) -> (String) -> Void {
    if distance < 5 {
        return {
            print("I'm walking to \($0).")
        }
    } else if distance < 20 {
        return {
            print("I'm cycling to \($0).")
        }
    } else {
        return {
            print("I'm driving to \($0).")
        }
    }
}
let travelMethod = createTravelMethod(distance: 15)
travelMethod("London")

// FINITO: 9/12 in 9:11

// MARK: - Capturing values
func travel2() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result3 = travel2()
result3("London")
result3("Turin")
result3("Bologna")

// 1. esempio corretto
func makeAdder() -> (Int) -> Void {
    var sum = 0
    return {
        sum += $0
        print("Sum is now \(sum)")
    }
}
let adder = makeAdder()
adder(5)
adder(3)

// 6. esempio corretto piuttosto complesso
func storeTwoValues(value1: String, value2: String) -> (String) -> String {
    var previous = value1
    var current = value2
    return { new in
        let removed = previous
        previous = current
        current = new
        return "Removed \(removed)"
    }
}
let store = storeTwoValues(value1: "Hello", value2: "World")
let removed = store("Value Three")
print(removed)

// 10. esempio corretto bello
func visitPlaces() -> (String) -> Void {
    var places = [String: Int]()
    return {
        places[$0, default: 0] += 1
        let timesVisited = places[$0, default: 0]
        print("Number of times I've visited \($0): \(timesVisited).")
    }
}
let visit = visitPlaces()
visit("London")
visit("New York")
visit("London")

// FINITO: 9/12 in 10:15

// MARK: - Closure summary
// FINITO: 6/6 in 00:45

