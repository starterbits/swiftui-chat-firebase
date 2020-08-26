//
//  ChatMessageModifier.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ChatMessageModifier : ViewModifier{
    var myMessage : Bool
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(myMessage ? Color.blue : Color.gray)
            .cornerRadius(7)
            .foregroundColor(Color.white)
    }
}
