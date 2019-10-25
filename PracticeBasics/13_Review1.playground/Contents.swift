import UIKit

// MARK: - Variables and constants
var name = "Tim McGraw"
name = "Romeo"

// MARK: - Types of data
var age: Int // type annotation
age = 25

/// Double and Floats
var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var massiveDouble: Double = 123456789.123456789

/// Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false
/// Here we meet camel case

/// Using type annotation wisely
/// Assigning a value is preferable to using type annotation -> Type inference

// MARK: - Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10 // add then assign
b -= 10

var c = 1.1
var d = 2.2
var e = c + d

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

var f = 1.1
var g = 2.2
var h = f + g

h > 3
h >= 3
h > 4
h < 4

var name3 = "Tim McGraw"
name == "Tim McGraw" // Swift strings are case sensitive.
name != "TIM McGraw"

!stayOutTooLate

// MARK: - String Interpolation
/* var */ name = "Tim McGraw"
"Your name is \(name)"
"Your name is " + name
/* var */ age = 25
/* var */ latitude = 36.166667

"Your name is \(name), your age is \(age), and your latitude is \(latitude)."

"Your age is \(age) years old. In another \(age) years you will be \(age * 2) years old."

// MARK: - Arrays
var evenNumbers = [2, 4, 6, 8]
var songs: [String] = ["Shake it Off", "You Belong with Me", "Back to December"]

/// Swift stats counting at 0.
songs[0]
songs[1]
songs[2]

type(of: songs)

/* var */ songs = []
// songs[0] = "Shake it Off" // we are trying to modify an element that doesn't exist yet.
var songs1 = ["Shake it Off", "You Belong With Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]

var bothArrays = songs1 + songs2
bothArrays += ["Everything has changed"]

print(bothArrays)

// MARK: - Dictionaries
var person = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]

person["middle"]
person["month"]

// MARK: - Conditional statements
var action: String
var person1 = "hater"

if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}
/// Short-circuit evaluation

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}

// MARK: - Loops
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

for i in 1...10 { // closed range operator
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}
print(str)

1 ..< 5 // half-open range operator

for song in songs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1
    
    if counter == 556 {
        break
    }
}
/// continue jumps out of the current iteration of the loop

for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    
    print("My favorite song is \(song)")
}

// MARK: - Switch case
let liveAlbums = 2

switch liveAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star!")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}
