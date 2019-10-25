import UIKit

// MARK: - Initialisers
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"

// 5. perché questo è corretto?
struct Dictionary {
    var words = Set<String>()
}
let dictionary = Dictionary() // se le proprietà hanno già un valore si può usare l'initialiser vuoto

// 7. un bell'esempio perché spiega come una proprietà può essere inizializzata durante il processo di creazione senza che gli si dia un valore di suo
struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}
let country = Country(countryName: "Nigeria")

// 10. l'initialiser non deve per forza dare altri nomi alle variabili
struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "Unknown"
        to = "Unknown"
        content = "Yo"
    }
}
let message = Message()

// 12. questo è corretto ma non capisco lo spazio
struct Cabinet {
    var height: Double
    var width: Double
    var area: Double
    init(itemHeight: Double, itemWidth: Double) {
        height = itemHeight
        width = itemWidth
        area = height * width
    }
}
let drawers = Cabinet(itemHeight: 1.4, itemWidth: 1.0)

// FINITO: 10/12

// MARK: - Referring to the current instance
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// FINITO: 12/12

// MARK: - Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

struct Persona {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Persona(name: "Ed")
ed.familyTree

// FINITO: 6/6

// MARK: - Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let edw = Student(name: "Edw")
let taylor = Student(name: "Taylor")

/// Having a **static** property/method means that it will be shared across all instances of the struct
print(Student.classSize)

// 2. codice problematico
//struct Question {
//    static let answer = 42
//    var questionText = "Unknown"
//    init(questionText: String, answer: String) {
//        self.questionText = questionText
//        self.answer = answer
//    }
//}

// 3. Interessante: la proprietà esiste solo nell'initialiser
struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            NewsStory.regularNewsCount += 1
        }
    }
}

// FINITO: 10/12, due errori di distrazione stupidi.

// MARK: - Access control
struct Personne {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let edika = Personne(id: "12345")

/// If there is a private property, Swift cannot generate the memberwise initialiser for us. Se quella proprietà è l'unica ed è già inizializzata, allora va bene... bah ...

// Perché questo è sbagliato? Questo non funziona e basta ...
//struct Doctor {
//    var name: String
//    var location: String
//    private var currentPatient = "No one"
//}
//let drJones = Doctor(name: "Esther Jones", location: "Bristol")

// 7. questo invece è giusto
struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])

// 8. Ma perché, per Dio?!
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: "Mrs Hughes", "Mr Hobbes") // parametro variadico maledetto

// FINITO: male ... 7/12 ... non è per niente chiaro il problema.

// MARK: - Structs summary
/// You’ve made it to the end of the seventh part of this series, so let’s summarize:
/// 1. You can create your own types using structures, which can have their own properties and methods.
/// 2. You can use stored properties or use computed properties to calculate values on the fly.
/// 3. If you want to change a property inside a method, you must mark it as mutating.
/// 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
/// 5. Use the self constant to refer to the current instance of a struct inside a method.
/// 6. The lazy keyword tells Swift to create properties only when they are first used.
/// 7. You can share properties and methods across all instances of a struct using the static keyword.
/// 8. Access control lets you restrict what code can use properties and methods

// FINITO: 6/6

