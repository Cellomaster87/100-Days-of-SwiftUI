//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Michele Galvagno on 31/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }.padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default)
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
