//
//  Colors-and-Frames.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 13/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct Colors_and_Frames: View {
    var body: some View {
        /*
        ZStack {
            /// This put the red only behind the text...
            Text("Your content").background(Color.red)
        }
        /// ...but so does this (?!)
//        .background(Color.red)
        */
        
        /// To have the whole view colored red, we need this
        /// because `Color`is a view in its own right
        /// We can use the `frame()` modifier to limit the space taken.
        ZStack {
            /// This first Color ignores the safe area
            Color.green.edgesIgnoringSafeArea(.all)
            Color.red.frame(width: 200, height: 200)
            Text("Your content").background(Color(red: 1, green: 0.8, blue: 0))
        }
    }
}

struct Colors_and_Frames_Previews: PreviewProvider {
    static var previews: some View {
        Colors_and_Frames()
    }
}
