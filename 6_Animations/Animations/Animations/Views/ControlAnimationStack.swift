//
//  ControlAnimationStack.swift
//  Animations
//
//  Created by Michele Galvagno on 01/11/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct ControlAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }.frame(width: 200, height: 200)
            .background(enabled ? Color.blue : Color.red)
                .animation(.default)
                    .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ControlAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControlAnimationStack()
    }
}
