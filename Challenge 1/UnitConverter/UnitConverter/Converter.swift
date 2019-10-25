//
//  Converter.swift
//  UnitConverter
//
//  Created by Michele Galvagno on 13/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

// MARK: - Conversion
extension UnitDuration {
    static let days = UnitDuration(symbol: "days", converter: UnitConverterLinear(coefficient: 86400))
}

extension ContentView {
    /*
    /// Convert **length**
    func convertLength(input: Double, from inputUnit: Int, to outputUnit: Int
    ) -> String {
        var baseInput = Measurement(value: input, unit: UnitLength.meters)
        var convertedInput: Measurement<UnitLength>
        
        switch inputUnit {
        case 1:
            baseInput = Measurement(value: input, unit: UnitLength.kilometers)
            convertedInput = baseInput.converted(to: UnitLength.meters)
        case 2:
            baseInput = Measurement(value: input, unit: UnitLength.feet)
            convertedInput = baseInput.converted(to: UnitLength.meters)
        case 3:
            baseInput = Measurement(value: input, unit: UnitLength.yards)
            convertedInput = baseInput.converted(to: UnitLength.meters)
        case 4:
            baseInput = Measurement(value: input, unit: UnitLength.miles)
            convertedInput = baseInput.converted(to: UnitLength.meters)
        default:
            convertedInput = baseInput
        }
        
        var output: Measurement<UnitLength>
        
        switch outputUnit {
        case 1:
            output = convertedInput.converted(to: UnitLength.kilometers)
        case 2:
            output = convertedInput.converted(to: UnitLength.feet)
        case 3:
            output = convertedInput.converted(to: UnitLength.yards)
        case 4:
            output = convertedInput.converted(to: UnitLength.miles)
        default:
            output = convertedInput
        }
        
        let formattedOutput = formatString(from: output)
        
        return formattedOutput
    }
    
    /// Convert **temperature**
    func convertTemperature(input: Double, from inputUnit: Int, to outputUnit: Int
    ) -> String {
        var baseInput = Measurement(value: input, unit: UnitTemperature.celsius)
        var convertedInput: Measurement<UnitTemperature>
        
        switch inputUnit {
        case 1:
            baseInput = Measurement(value: input, unit: UnitTemperature.fahrenheit)
            convertedInput = baseInput.converted(to: UnitTemperature.celsius)
        case 2:
            baseInput = Measurement(value: input, unit: UnitTemperature.kelvin)
            convertedInput = baseInput.converted(to: UnitTemperature.celsius)
        default:
            convertedInput = baseInput
        }
        
        var output: Measurement<UnitTemperature>
        
        switch outputUnit {
        case 1:
            output = convertedInput.converted(to: UnitTemperature.fahrenheit)
        case 2:
            output = convertedInput.converted(to: UnitTemperature.kelvin)
        default:
            output = convertedInput
        }
        
        let formattedOutput = formatString(from: output)
        
        return formattedOutput
    }
    
    /// Convert **time**
    func convertTime(input: Double, from inputUnit: Int, to outputUnit: Int
    ) -> String {
        var baseInput = Measurement(value: input, unit: UnitDuration.baseUnit())
        var convertedInput: Measurement<UnitDuration>
        
        switch inputUnit {
        case 1:
            baseInput = Measurement(value: input, unit: UnitDuration.minutes)
            convertedInput = baseInput.converted(to: UnitDuration.baseUnit())
        case 2:
            baseInput = Measurement(value: input, unit: UnitDuration.hours)
            convertedInput = baseInput.converted(to: UnitDuration.baseUnit())
        case 3:
            baseInput = Measurement(value: input, unit: UnitDuration.days)
            convertedInput = baseInput.converted(to: UnitDuration.baseUnit())
        default:
            convertedInput = baseInput
        }
        
        var output: Measurement<UnitDuration>
        
        switch outputUnit {
        case 1:
            output = convertedInput.converted(to: UnitDuration.minutes)
        case 2:
            output = convertedInput.converted(to: UnitDuration.hours)
        case 3:
            output = convertedInput.converted(to: UnitDuration.days)
        default:
            output = convertedInput
        }
        
        let formattedOutput = formatString(from: output)
        
        return formattedOutput
    }
    
    /// Convert **volume**
    func convertVolume(input: Double, from inputUnit: Int, to outputUnit: Int
    ) -> String {
        var baseInput = Measurement(value: input, unit: UnitVolume.milliliters)
        var convertedInput: Measurement<UnitVolume>
        
        switch inputUnit {
        case 1:
            baseInput = Measurement(value: input, unit: UnitVolume.liters)
            convertedInput = baseInput.converted(to: UnitVolume.milliliters)
        case 2:
            baseInput = Measurement(value: input, unit: UnitVolume.cups)
            convertedInput = baseInput.converted(to: UnitVolume.milliliters)
        case 3:
            baseInput = Measurement(value: input, unit: UnitVolume.pints)
            convertedInput = baseInput.converted(to: UnitVolume.milliliters)
        case 4:
            baseInput = Measurement(value: input, unit: UnitVolume.gallons)
            convertedInput = baseInput.converted(to: UnitVolume.milliliters)
        default:
            convertedInput = baseInput
        }
        
        var output: Measurement<UnitVolume>
        
        switch outputUnit {
        case 1:
            output = convertedInput.converted(to: UnitVolume.liters)
        case 2:
            output = convertedInput.converted(to: UnitVolume.cups)
        case 3:
            output = convertedInput.converted(to: UnitVolume.pints)
        case 4:
            output = convertedInput.converted(to: UnitVolume.gallons)
        default:
            output = convertedInput
        }
        
        let formattedOutput = formatString(from: output)
        
        return formattedOutput
    }
    */
    
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
