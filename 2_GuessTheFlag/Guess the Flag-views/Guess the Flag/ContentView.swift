//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 13/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

/// This returns exactly **ONE** view of a specific type that conforms to the `View` protocol
struct ContentView: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Spacer()
                _3x3Grid()
                Colors_and_Frames()
            }.tabItem {
                Image(systemName: "1.square.fill")
                Text("Grids")
                }
            
            Gradients()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Gradients")
                }
            
            Buttons()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Buttons")
                }
            
            Alerts()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    Text("Alerts")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
