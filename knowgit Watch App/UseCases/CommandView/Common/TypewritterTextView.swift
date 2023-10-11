//
//  TypewritterTextView.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 11/10/23.
//

import SwiftUI

struct TypewriterTextView: View {
    let text: String
    @State private var displayedText: String = ""
    @State private var currentIndex: Int = 0
    private let typingSpeed: Double = 0.1
    var body: some View {
        Text(displayedText)
            .font(.body)
            .onAppear {
                startTyping()
            }
            .padding()
    }

    private func startTyping() {
        Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { timer in
            guard currentIndex < text.count else {
                timer.invalidate()
                return
            }
            
            let index = text.index(text.startIndex, offsetBy: currentIndex)
            displayedText.append(text[index])
            currentIndex += 1
        }
    }
}

#Preview {
    TypewriterTextView(text: "Ejemplo de TypewriterTextView")
}
