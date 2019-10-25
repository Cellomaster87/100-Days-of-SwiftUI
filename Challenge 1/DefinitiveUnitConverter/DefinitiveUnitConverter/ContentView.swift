//
//  ContentView.swift
//  DefinitiveUnitConverter
//
//  Created by Michele Galvagno on 14/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var conversionType = 0
    @State private var inputUnit = [0, 0, 0, 0]
    @State private var outputUnit = [0, 0, 0, 0]
    
    let inputCategories = ["Length", "Temperature", "Time", "Volume"]
    
    @State private var inputUnits: [[String]] = [
        ["meters", "kilometers", "feet", "yards", "miles"],
        ["Celsius", "Fahrenheit", "Kelvin"],
        ["seconds", "minutes", "hours", "days"],
        ["milliliters", "liters", "cups", "pints", "gallons"]
    ]
    
    var selectedUnit: [String] {
        return inputUnits[conversionType]
    }
    
    var output: String {
        let conversion = convert(userInput, of: conversionType, from: inputUnit[conversionType], to: outputUnit[conversionType])
        return conversion
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("What do you want to convert?").font(.headline)) {
                    Picker("Choose a category", selection: $conversionType) {
                        ForEach(0 ..< inputCategories.count) {
                            Text("\(self.inputCategories[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Input")) {
                    TextField("Enter a value", text: $userInput)
                        .keyboardType(.decimalPad)
                    Picker("Input Unit", selection: $inputUnit[conversionType]) {
                        ForEach(0 ..< selectedUnit.count) {
                            Text("\(self.selectedUnit[$0])")
                        }
                    }.id(conversionType)
                        .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Picker("Output Unit", selection: $outputUnit[conversionType]) {
                        ForEach(0 ..< selectedUnit.count) {
                            Text("\(self.selectedUnit[$0])")
                        }
                    }.id(conversionType)
                        .pickerStyle(SegmentedPickerStyle())
                    
                    Text(output)
                }
            }
            .navigationBarTitle("Unit Converter")
        }
        .environment(\.horizontalSizeClass, .compact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
