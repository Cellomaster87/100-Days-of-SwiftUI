import UIKit

/// Represent 8am today
var components = DateComponents()
components.hour = 8
components.minute = 0
let date = Calendar.current.date(from: components) ?? Date()

/// How to read the hour
let someDate = Date()
let theComponents = Calendar.current.dateComponents([.hour, .minute], from: someDate)
let hour = theComponents.hour ?? 0
let minute = theComponents.minute ?? 0

/// How we can format dates and times
let formatter = DateFormatter()
formatter.timeStyle = .short
formatter.dateStyle = .medium
//formatter.dateFormat = 
let dateString = formatter.string(from: Date())

