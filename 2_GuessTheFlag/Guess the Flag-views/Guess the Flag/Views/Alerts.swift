//
//  Alerts.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 14/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

/// We need to create our **alert** and set the **conditions** under which it should be shown
/// 1. create some state that trackes whether our alert is showing
/// 2. attach that alert to a UI element, telling it to use the state to determine the presentation of the alert
/// 3. SwiftUI will automatically set `showingAlert` back to `false` when the alert is dismissed!
struct Alerts: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            }
        
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
