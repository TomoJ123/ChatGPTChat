//
//  ChatInputView.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 19.03.2023..
//

import SwiftUI

struct ChatInputView: View {
    @EnvironmentObject var viewModel: ChatViewModel

    var body: some View {
                VStack(alignment: .center) {
                    HStack(spacing: 0) {
                        TextField("Type here...", text: $viewModel.inputText, axis: .vertical)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color("chatBackgroundColor"))
                            .cornerRadius(25)
                            .padding([.leading, .trailing], 20)

                        Button {
                            UIApplication.dismissKeyboard()
                            viewModel.sendQuestion(text: viewModel.inputText)
                            viewModel.inputText = ""
                        } label: {
                            Text("Send")
                        }
                        .padding(.trailing, 15)
                        .disabled(viewModel.inputText.isEmpty)
                    }
                }
//                .cornerRadius(20, corners: .topRight)
//                .cornerRadius(20, corners: .topLeft)
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 100, alignment: .center)
                .background(Color("chatSecondaryColor"))
    }
}

struct ChatInputView_Previews: PreviewProvider {
    static var previews: some View {
        ChatInputView()
            .environmentObject(ChatViewModel(chatGPTService: ChatGPTService()))
    }
}
