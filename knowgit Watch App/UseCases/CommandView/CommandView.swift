//
//  CommandView.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 7/10/23.
//

import SwiftUI

struct CommandView<Command: CommandProtocol>: View {
    
    let question: Command
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(question.command, id: \.self) { partial in
                    Text(partial)
                        .foregroundStyle(.green)
                        .font(.title)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                }
            }
        }
    }
}

#Preview {
    CommandView(question: GitQuestion(
        command: ["git", "checkout", "-b", "develop", "-f"],
        description: "Cambia a la rama develop"
    ))
}

