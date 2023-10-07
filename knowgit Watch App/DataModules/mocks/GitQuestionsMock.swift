//
//  GitQuestionsMock.swift
//  knowgit Watch App
//
//  Created by Jose Manuel Ortiz Sanchez on 7/10/23.
//

import Foundation

final class GitQuestionsMock {
    
    let repository: GitQuestionRepositoryProtocol
    var questions: [GitQuestion]
    
    init(
        repository: GitQuestionRepositoryProtocol = LocalJsonGitQuestionRepository(),
        questions: [GitQuestion] = []
    ) {
        self.repository = repository
        self.questions = questions
        Task { try await loadQuestions() }
    }
    
    func getRandomGitQuestion() -> GitQuestion? {
        questions.randomElement()
    }
    
    private func loadQuestions() async throws -> Void {
        self.questions = try await repository.getQuestions()
    }
}
