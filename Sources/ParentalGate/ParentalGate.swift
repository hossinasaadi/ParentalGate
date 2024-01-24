import SwiftUI

struct ParentalGate: View, GateProtocol {
    @Binding var isPresent: Bool

    var style: GateStyle
    
    var solved: () -> Void
    var dismiss: () -> Void

    var body: some View {
            ZStack {
                if isPresent {
                    if style == .math {
                        MathView(solved: solved, dismiss: dismiss)
                    } else if style == .slide {
                        
                        SlideView(solved: solved, dismiss: dismiss)
                        
                    }
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
