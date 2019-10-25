//
//  ContentViewExtension.swift
//  DefinitiveUnitConverter
//
//  Created by Michele Galvagno on 14/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

// MARK: - Conversion
extension UnitDuration {
    static let days = UnitDuration(symbol: "days", converter: UnitConverterLinear(coefficient: 86400))
}

extension ContentView {    
    /// One method does **all**
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
    
    /// Format string from any kind of `Measurement`
    func formatString<T: Unit>(from dimension: Measurement<T>) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit
        
        let formattedOutput = formatter.string(from: dimension)
        
        return formattedOutput
    }
}
