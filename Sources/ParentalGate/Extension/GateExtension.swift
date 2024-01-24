//
//  GateExtension.swift
//  
//
//  Created by HossinAsaadi on 1/24/24.
//

import SwiftUI

extension ParentalGate {
    func customGate<T: View>(@ViewBuilder _ replacement: @escaping (ParentalGate) -> T) -> some View {
        self.modifier(ReplaceContentModifier(gate: self) {
            replacement(self)
        })

    }
}

struct ReplaceContentModifier<T: View>: ViewModifier {
    let gate: ParentalGate
    let replacement: () -> T

    func body(content: Content) -> some View {
        if gate.style == .custom && gate.isPresent {
            replacement()
        }else {
            content
        }
    }
}
