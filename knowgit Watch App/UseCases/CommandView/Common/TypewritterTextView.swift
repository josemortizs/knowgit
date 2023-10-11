//
//  TypewritterTextView.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 11/10/23.
//

import SwiftUI

struct TypewriterTextView: View {
    
    @State private var displayedText: String
    @State private var currentIndex: Int
    
    var typingSpeed: Double
    let text: String
    
    init(
        typingSpeed: Double = 0.1,
        text: String
    ) {
        self._displayedText = State(initialValue: "")
        self._currentIndex = State(initialValue: 0)
        self.typingSpeed = typingSpeed
        self.text = text
    }

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
    
    func typingSpeed(_ typingSpeed: Double) -> TypewriterTextView {
        var view = self
        view.typingSpeed = typingSpeed
        return view
    }
}

#Preview {
    TypewriterTextView(text: "Ejemplo de TypewriterTextView")
        .typingSpeed(0.07)
}
