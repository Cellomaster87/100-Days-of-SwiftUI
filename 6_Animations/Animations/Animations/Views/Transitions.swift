//
//  Transitions.swift
//  Animations
//
//  Created by Michele Galvagno on 01/11/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct Transitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//                    .transition(.pivot)
            }
        }
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
