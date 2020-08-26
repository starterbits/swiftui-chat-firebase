//
//  ButtonModifiers.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    private let title: String
    private let backgroundColor: UIColor
    private let textColor: UIColor
    private let action: () -> Void
    private let width: CGFloat?
    private let height: CGFloat?
    
    init(title: String,
         backgroundColor: UIColor = UIConfiguration.tintColor,
         textColor: UIColor = .white,
         width: CGFloat? = 275,
         height: CGFloat? = 55,
         action: @escaping () -> Void) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.width = width
        self.height = height
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .modifier(ButtonModifier(font: UIConfiguration.buttonFont,
                                         color: backgroundColor,
                                         textColor: .white,
                                         width: width,
                                         height: height))
        }
    }
}

struct ButtonModifier: ViewModifier {
    private let font: UIFont
    private let color: UIColor
    private let textColor: UIColor
    private let width: CGFloat?
    private let height: CGFloat?
    
    init(font: UIFont,
         color: UIColor,
         textColor: UIColor = .white,
         width: CGFloat? = nil,
         height: CGFloat? = nil) {
        self.font = font
        self.color = color
        self.textColor = textColor
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .modifier(TextModifier(font: font,
                                   color: textColor))
            .padding()
            .frame(width: width, height: height)
            .background(Color(color))
            .cornerRadius(25.0)
    }
}
