//
//  GitQuestionRepository.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 7/10/23.
//

import Foundation

protocol GitQuestionRepositoryProtocol {
    func getQuestions() async throws -> [GitQuestion]
}

final class LocalJsonGitQuestionRepository: GitQuestionRepositoryProtocol {
    
    func getQuestions() async throws -> [GitQuestion] {

        guard let fileURL = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            fatalError("No se encontró el archivo JSON")
        }
        
        let jsonData = try Data(contentsOf: fileURL)
        let gitQuestions = try JSONDecoder().decode([GitQuestion].self, from: jsonData)
        return gitQuestions
    }
}
