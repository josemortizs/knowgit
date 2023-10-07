//
//  GitQuestion.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 7/10/23.
//

import Foundation

struct GitQuestion: Codable, Identifiable {
    let id: String
    let command: [String]
    let description: String
}

extension GitQuestion {
    init(command: [String], description: String) {
        self.id = UUID().uuidString
        self.command = command
        self.description = description
    }
}
