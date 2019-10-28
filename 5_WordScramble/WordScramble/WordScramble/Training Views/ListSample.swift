//
//  ListSample.swift
//  WordScramble
//
//  Created by Michele Galvagno on 28/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ListSample: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List(people, id: \.self) {
            Text($0)
        }
//        List/*(0 ..< 5) */ {
//            Section(header: Text("Section 1")) {
//                Text("Static Row 1")
//                Text("Static Row 2")
//            }
//
//            Section(header: Text("Section 2")) {
//                ForEach(0 ..< 5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section(header: Text("Section 3")) {
//                Text("Static Row 3")
//                Text("Static Row 4")
//            }
            
            
            /* Text("Dynamic row \($0)") */
//        }
    }
}

struct ListSample_Previews: PreviewProvider {
    static var previews: some View {
        ListSample()
    }
}
