//
//  ChatGPTService.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 20.03.2023..
//

import Foundation
import OpenAISwift

class ChatGPTService {
    private var openAI: OpenAISwift?

    init() {
        self.openAI = OpenAISwift(authToken: "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")
    }

    func sendQuestion(text: String) async throws -> String? {
        let result = try await openAI?.sendCompletion(with: text, maxTokens: 150)
        return result?.choices.first?.text ?? ""
    }
}
