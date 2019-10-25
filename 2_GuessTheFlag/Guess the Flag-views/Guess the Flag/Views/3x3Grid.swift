//
//  3x3Grid.swift
//  Guess the Flag
//
//  Created by Michele Galvagno on 13/10/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SwiftUI

/// **Test**: create a 3x3 grid!
struct _3x3Grid: View {
    var body: some View {
        VStack {
            ForEach(0 ..< 3) { i in
                HStack {
                    ForEach(0 ..< 3) { j in
                        Text("Square \(1 + (i * 3) + j)")
                            .padding()  
                            .border(Color.black, width: 4)
                    }
                }
            }
        }
    }
}

struct _3x3Grid_Previews: PreviewProvider {
    static var previews: some View {
        _3x3Grid()
    }
}
