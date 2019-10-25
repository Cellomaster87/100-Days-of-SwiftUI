//
//  ForEachID.swift
//  
//
//  Created by Michele Galvagno on 24/10/2019.
//

import SwiftUI

struct ForEachID: View {
    var agents: String = ["Cyril", "Lana", "Pam", "Sterling"]
    
    var body: some View {
        VStack {
            ForEach(agents, id: \.self) {
                Text($0)
            }
        }
    }
}

struct ForEachID_Previews: PreviewProvider {
    static var previews: some View {
        ForEachID()
    }
}
