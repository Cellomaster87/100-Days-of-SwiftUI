//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Michele Galvagno on 17/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    var body: some View {
//        GridStack(rows: 4, columns: 4) { (row, col) in
//            HStack {
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//            }
//        }
//    }
    var body: some View {
        Text("STAR WARS")
            .prominentTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
