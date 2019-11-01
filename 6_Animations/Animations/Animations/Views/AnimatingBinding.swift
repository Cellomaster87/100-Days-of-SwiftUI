//
//  AnimatingBinding.swift
//  Animations
//
//  Created by Michele Galvagno on 31/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct AnimatingBinding: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
                ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }.padding()
                .background(Color.red)
                    .foregroundColor(.white)
                        .clipShape(Circle())
                            .scaleEffect(animationAmount)
        }
    }
}

struct AnimatingBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBinding()
    }
}
