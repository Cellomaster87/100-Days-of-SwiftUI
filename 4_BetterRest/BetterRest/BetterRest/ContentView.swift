//
//  ContentView.swift
//  BetterRest
//
//  Created by Michele Galvagno on 25/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var recommendedBedtime: String {
        calculateBedTime()
    }
    
    var body: some View {
        NavigationView {
            Form {
                /// Challenge 1: changed `VStack` with `Section`
                Section(header: Text("When do you want to wake up?")
                    .font(.headline)) {
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                    
                Section(header: Text("Desired amount of sleep")
                    .font(.headline)) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("Daily coffee intake")
                    .font(.headline)) {
                        /// Challenge 2: changed `Stepper` with `Picker`
                        Picker("Coffee intake", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) { i in
                                Text("\(i) \(i == 1 ? "cup" : "cups")")
                            }
                        }.id("coffee")
                        .labelsHidden()
                        .pickerStyle(WheelPickerStyle())
                }
                
                /// Challenge 3: show recommended bedtime using a nice and large font. Remove the "Calculate" button as well.
                Section(header: Text("Recommended bedtime").font(.headline)) {
                    Text(recommendedBedtime)
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
}

extension ContentView {
    func calculateBedTime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
 
            return formatter.string(from: sleepTime)
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
