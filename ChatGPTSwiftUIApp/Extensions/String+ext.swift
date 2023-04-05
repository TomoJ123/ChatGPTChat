//
//  String+ext.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 20.03.2023..
//

import Foundation

extension String {
    func removeLineBreaksFromBeginning() -> String {
        var newString = self
        while newString.prefix(1) == "\n" {
            newString.removeFirst()
        }

        return newString
    }
}
