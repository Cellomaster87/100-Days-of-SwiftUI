//
//  Stepper.swift
//  BetterRest
//
//  Created by Michele Galvagno on 25/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct Steppers: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier: "%g") hours")
        }
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        Steppers()
    }
}
