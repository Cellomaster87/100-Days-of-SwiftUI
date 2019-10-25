//
//  Buttons.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 14/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

/// Two ways to create buttons:
/// 1. just some text with closure for what happens when tapped. This is not documented.
///     It seems that this is `init(LocalizedStringKey, action: () -> Void)`
/// 2. to get combination of views, use alternative form
/// To add an **Image** use `Image("pencil")` or `Image(decorative: "pencil")` or `Image(systemName: "pencil")`
struct Buttons: View {
    var body: some View {
        VStack(spacing: 10) {
            Button("Tap me!") {
                print("Button was tapped!")
            }.padding(4).border(Color.primary, width: 2)
            
            Button(action: {
                print("Button was tapped")
            }) {
                Text("Tap me!")
            }.padding(4).border(Color.primary, width: 2)
            
            Button(action: {
                print("Edit button was tapped")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil").renderingMode(.original)
                    Text("Edit")
                }
            }.padding(4).border(Color.primary, width: 2)
            
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
