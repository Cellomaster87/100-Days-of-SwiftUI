//
//  Bindings-advanced.swift
//  
//
//  Created by Michele Galvagno on 24/10/2019.
//

import SwiftUI

struct Bindings_advanced: View {
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    var body: some View {
        let agreedToAll = Binding(
            get: {
                self.agreedToTerms && self.agreedToPrivacyPolicy && self.agreedToEmails
            },
            set: {
                self.agreedToTerms = $0
                self.agreedToPrivacyPolicy = $0
                self.agreedToEmails = $0
            }
        )
        
        return VStack {
            Toggle(isOn: $agreedToTerms) {
                Text("Agree to terms")
            }
            
            Toggle(isOn: $agreedToPrivacyPolicy) {
                Text("Agree to privacy policy")
            }
            
            Toggle(isOn: $agreedToEmails) {
                Text("Agree to receive shipping emails")
            }
            
            Toggle(isOn: agreedToAll) {
                Text("Agree to all")
            }
        }
    }
}

struct Bindings_advanced_Previews: PreviewProvider {
    static var previews: some View {
        Bindings_advanced()
    }
}
