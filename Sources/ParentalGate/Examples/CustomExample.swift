//
//  CustomExample.swift
//
//
//  Created by HossinAsaadi on 1/25/24.
//

import SwiftUI

struct CustomExample: View {
    @State var isPresent: Bool = false
    @State var text = "Click Here!"

    var body: some View {
        if !isPresent {
            Text(text).onTapGesture {
                isPresent = true
            }.foregroundColor(isPresent ? .red : .blue)
        }

        ParentalGate(isPresent: $isPresent, style: .custom) {
            isPresent = false
            text = "Solved!"
        } dismiss: {
            isPresent = false
            text = "Canceled,Click Here again!"

        
        }.customGate { ParentalGate in
            CustomGate(solved: ParentalGate.solved, dismiss:ParentalGate.dismiss)
        }
    }
}

struct CustomGate: View, GateProtocol {
    var solved: () -> Void
    
    var dismiss: () -> Void
    
    @State var isPresent: Bool = false
    @State var text = "Click Here!"

    var body: some View {
       
        VStack {
            Text("are you older than 12?")
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("No")
                }
                .padding()
                Button {
                    solved()
                } label: {
                    Text("Yes")
                }
                .padding()

            }
        }
    }
}

#Preview {
    CustomExample()
}
