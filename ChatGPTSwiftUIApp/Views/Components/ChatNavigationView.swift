//
//  ChatNavigationView.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 19.03.2023..
//

import SwiftUI

struct ChatNavigationView: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("chatBotGPTIcon")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.all, 10)
                .background(Color("chatBackgroundColor"))
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("ChatGPT Bot")
                    .foregroundColor(.black)

                Text("Online")
                    .foregroundColor(.green)
                    .font(.system(size: 12))
            }
        }
        .frame(maxWidth: .infinity, idealHeight: 50, alignment: .leading)
        .padding(.top, 50)
        .padding(.bottom, 10)
        .padding(.leading, 20)
        .background(Color("chatSecondaryColor"))
        .cornerRadius(20, corners: .bottomLeft)
        .cornerRadius(20, corners: .bottomRight)
    }
}

struct ChatNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ChatNavigationView()
    }
}
