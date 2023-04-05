//
//  ChatView.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 19.03.2023..
//

import SwiftUI
import UIKit
import Combine

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel(chatGPTService: ChatGPTService())
    
    var body: some View {
        VStack(spacing: 0) {
            ChatNavigationView()

            ScrollViewReader { proxy in
                ScrollView {
                        VStack {
                            ForEach(viewModel.messages, id: \.id) { message in
                                ChatBubble(direction: message.owner == .user ? .left : .right) {
                                    if message.owner == .botTyping {
                                        TypingAnimationView()
                                            .padding(.all, 20)
                                            .padding(.top, 5)
                                            .background(Color("chatBotBubbleColor"))
                                    } else {
                                        Text(message.message ?? "")
                                            .padding(.all, 20)
                                            .foregroundColor(Color.white)
                                            .background(message.owner == .user ? Color.blue : Color("chatBotBubbleColor"))
                                    }
                                }
                                .id(message.id)
                            }
                        }
                }
                .modifier(DismissingKeyboard())
                .onChange(of: viewModel.messages.count) { _ in

                    withAnimation(.easeInOut(duration: 0.7)) {
                        proxy.scrollTo(viewModel.messages.last?.id)
                    }
                }
                .onReceive(Publishers.keyboardDidShow) { _ in
                    withAnimation(.easeInOut(duration: 0.7)) {
                        proxy.scrollTo(viewModel.messages.last?.id)
                    }
                }
            }

            ChatInputView()
        }
        .edgesIgnoringSafeArea(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("chatBackgroundColor"))
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatViewModel(chatGPTService: ChatGPTService()))
    }
}
