//
//  MultipleViews.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 13/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct MultipleViews: View {
    var body: some View {
        /// This is a _vertical stack_ of views
        /// By default there little or no spacing between the views
        /// Use the `(spacing: Double)` modifier
        /// Maximum of 10 children as well (use `Group` if you want more)
        /// `VStack` aligns its views so they are centered. Use the `(alignment: HorizontalAlignment` modifier
        /// `HStack` work in the same way
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello World!")
            Text("This is another text view")
            /// `V` and `HStack` align themselves to the center of the available space
            /// Use `Spacer()` to push views
            Spacer()
            
            /// `ZStack` arranges things in depth, with alignment
            ZStack(alignment: .top) {
                Text("Hello World")
                Text("This is inside a stack")
            }
        }
    }
}

struct MultipleViews_Previews: PreviewProvider {
    static var previews: some View {
        MultipleViews()
    }
}
