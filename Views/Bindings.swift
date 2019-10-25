//
//  Bindings.swift
//  
//
//  Created by Michele Galvagno on 24/10/2019.
//

import SwiftUI

struct Bindings: View {
    @State var selection = 0 {
        didSet {
            print("Selection was changed to \(selection)")
        }
    }
    
    var body: some View {
        let binding = Binding(
            get: { self.selection },
            set: { self.selection = $0 }
        )
        
        return VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0 ..< 3) {
                    Text("Item \($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct Bindings_Previews: PreviewProvider {
    static var previews: some View {
        Bindings()
    }
}
