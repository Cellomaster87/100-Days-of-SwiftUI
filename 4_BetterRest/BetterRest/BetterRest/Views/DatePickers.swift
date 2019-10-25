//
//  DatePickers.swift
//  BetterRest
//
//  Created by Michele Galvagno on 25/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct DatePickers: View {
    /// This lets us ask users to enter a date
    @State private var wakeUp = Date()
    
    /// When you create a new `Date()` instance it will be set to the current date and time
    let now = Date()
    /// Create a second `Date` instance set to one day in seconds from now
    let tomorrow = Date().addingTimeInterval(86400)
    ///Create a range from those two (created as lazy as it cannot be available now)
    lazy var range = now ... tomorrow
    
    var body: some View {
        /// Some issues right now with how Pickers are shown
//        Form {
//            DatePicker("Please enter a date", selection: $wakeUp)
//        }
        /// Remember the parameter `displayedComponents:`
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
//            .labelsHidden()
    }
}

struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        DatePickers()
    }
}
