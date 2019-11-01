//
//  AnimatingGestures.swift
//  Animations
//
//  Created by Michele Galvagno on 01/11/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

struct AnimatingGestures: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                self.dragAmount = value.translation
                            })
                            .onEnded({ (_) in
                                withAnimation(.spring()) {
                                    self.dragAmount = .zero
                                }
                                
                            })
                        )
//            .animation(.spring())
    }
}

struct AnimatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestures()
    }
}
