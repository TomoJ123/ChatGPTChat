//
//  TypingAnimationView.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 23.03.2023..
//

import SwiftUI

struct TypingAnimationView: View {

    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State private var count = 0

    var body: some View {
        HStack(spacing: 5) {
            Circle()
                .offset(y: count == 1 ? -15 : 0)
            Circle()
                .offset(y: count == 2 ? -15 : 0)
            Circle()
                .offset(y: count == 3 ? -15 : 0)
        }
        .frame(width: 60)
        .foregroundColor(.black)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.3)) {
                count = count == 3 ? 0 : count + 1
            }
        }
    }
}

struct TypingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimationView()
    }
}
