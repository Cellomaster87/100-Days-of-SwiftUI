//
//  ContentView.swift
//  UnitConverter2
//
//  Created by Michele Galvagno on 14/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var conversionType = 0
    @State private var inputUnit = Array(repeating: 0, count: 4)
    @State private var outputUnit = Array(repeating: 0, count: 4)
    
    let inputCategories = ["Length", "Temperature", "Time", "Volume"]
    let inputUnits: [[String]] = [
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
                    TextField("Enter a value", text: $userInput).keyboardType(.decimalPad)
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
            }.navigationBarTitle("Unit Converter")
        }.environment(\.horizontalSizeClass, .compact)
    }
}

extension ContentView {
    func convert(_ input: String, of category: Int, from inputUnit: Int, to outputUnit: Int) -> String {
        if let doubleInput = Double(input) {
            let dimensionUnits: [[Dimension]] = [
                [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
                [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
                [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours, UnitDuration.days],
                [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
            ]
            
            let baseInput = Measurement(value: doubleInput, unit: dimensionUnits[category][inputUnit])
            let baseOutput = baseInput.converted(to: dimensionUnits[category][outputUnit])
            let conversion = formatString(from: baseOutput)
            
            return conversion
        } else {
            return "Invalid input"
        }
    }
    
    func formatString<T: Unit>(from dimension: Measurement<T>) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit
        
        let formattedOutput = formatter.string(from: dimension)
        
        return formattedOutput
    }
}

extension UnitDuration {
    static let days = UnitDuration(symbol: "days", converter: UnitConverterLinear(coefficient: 86400))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
