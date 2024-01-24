import SwiftUI

struct ParentalGate: View, GateProtocol {
    @Binding var isPresent: Bool

    var style: GateStyle
    
    var solved: () -> Void
    var dismiss: () -> Void

    var body: some View {
            ZStack {
                if style == .math && isPresent {
                    MathView(solved: solved, dismiss: dismiss)
                } else if style == .custom {
                    
//                    content
                }
            }

    }
}

#Preview {
    ParentalGate(isPresent: .constant(true), style: .math) {
         // Solved
    } dismiss: {
        // Canceled
    
    }



}
