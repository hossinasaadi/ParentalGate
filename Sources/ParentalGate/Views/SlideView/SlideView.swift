//
//  SwiftUIView.swift
//  
//
//  Created by HossinAsaadi on 1/24/24.
//

import SwiftUI

struct SlideView: View, GateProtocol {
    @State private var isLocked = true
    @State private var isLoading = false

    var solved: ()->Void
    var dismiss: ()->Void

    var body: some View {
        VStack {
            Text("Slide right to proceed")
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                BackgroundComponent()
                DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width)
                
            }
            .frame(height: 50)


            }
            Button("Cancel") {
                dismiss()
            }

        }
        .frame(height: 150)
        .padding()
        .padding(.bottom, 20)
        .onChange(of: isLocked) { isLocked in
            guard !isLocked else { return }
            solved()
            
        }
    }

}


#Preview {
    SlideView(solved: {}, dismiss: {})
}
