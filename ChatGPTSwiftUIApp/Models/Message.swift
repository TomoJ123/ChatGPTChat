//
//  Message.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 20.03.2023..
//

import Foundation

enum MessageOwner {
    case user
    case bot
    case botTyping
}

struct Message: Hashable {
    let id: String = UUID().uuidString
    let owner: MessageOwner
    let message: String?
}
