//
//  Publishers+ext.swift
//  ChatGPTSwiftUIApp
//
//  Created by Tomislav Juric-Arambasic on 23.03.2023..
//

import Combine
import UIKit

extension Publishers {
    static var keyboardDidShow: AnyPublisher<Bool, Never> {
        return NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)
            .map { _ in true }
            .eraseToAnyPublisher()
    }
}
