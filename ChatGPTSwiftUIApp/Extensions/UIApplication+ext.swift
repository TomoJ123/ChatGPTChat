//
//  UIResponder+Current.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 20.03.2023..
//

import UIKit

extension UIApplication {
    static func dismissKeyboard() {
        self.shared.windows.filter { $0.isKeyWindow }.first?.endEditing(true)
    }
}
