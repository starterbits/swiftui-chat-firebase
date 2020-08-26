//
//  CustomModifiers.swift
//  ChatApp
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct TextModifier: ViewModifier {
    private let font: UIFont
    private let color: UIColor
    
    init(font: UIFont, color: UIColor = .black) {
        self.font = font
        self.color = color
    }
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom(font.fontName, size: font.pointSize))
            .foregroundColor(Color(color))
            .multilineTextAlignment(.center)
            .lineLimit(nil)
    }
}

struct ShadowModifier: ViewModifier {
    let color: UIColor
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(color), radius: 5.0, x: 3, y: 3)
    }
}
