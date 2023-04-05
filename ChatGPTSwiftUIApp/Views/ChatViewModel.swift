//
//  ChatViewModel.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 19.03.2023..
//

import Foundation

@MainActor class ChatViewModel: ObservableObject {
    private let chatGPTService: ChatGPTService

    @Published var inputText = ""
    @Published var messages: [Message] = []

    init(chatGPTService: ChatGPTService) {
        self.chatGPTService = chatGPTService
    }

    func sendQuestion(text: String) {
        let newUserMessage = Message(owner: .user, message: text)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            let botTypingMessage = Message(owner: .botTyping, message: "")
            self?.messages.append(botTypingMessage)
        }
        messages.append(newUserMessage)

        Task {
            do {
                let result = try await chatGPTService.sendQuestion(text: text)
                guard let newBotMessage = result else { return }

                let message = Message(owner: .bot, message: newBotMessage.removeLineBreaksFromBeginning())
                print(message)

                messages.removeAll(where: { $0.owner == .botTyping })

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                    self?.messages.append(message)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
