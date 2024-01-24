//
//  MathExample.swift
//  
//
//  Created by HossinAsaadi on 1/25/24.
//

import SwiftUI

struct MathExample: View {
    @State var isPresent: Bool = false
    @State var text = "Click Here!"

    var body: some View {
        if !isPresent {
            Text(text).onTapGesture {
                isPresent = true
            }.foregroundColor(isPresent ? .red : .blue)
        }

        ParentalGate(isPresent: $isPresent, style: .math) {
            isPresent = false
            text = "Solved!"
        } dismiss: {
            isPresent = false
            text = "Canceled,Click Here again!"

        
        }
    }
}

#Preview {
    MathExample()
}
