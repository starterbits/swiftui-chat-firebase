//
//  ChatMessageView.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ChatMessageView: View {
    var message : Message
    var uid: String
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        
        HStack {
            if message.imageUrl != nil {
                if message.fromId == uid {
                    HStack {
                        Spacer()
                        image
                    }.padding(.leading,75)
                } else {
                    HStack {
                        image
                        Spacer()
                    }.padding(.trailing,75)
                }
            } else {
                if message.fromId == uid {
                    HStack {
                        Spacer()
                        Text(message.text ?? "")
                            .modifier(ChatMessageModifier(myMessage: true))
                    }.padding(.leading,75)
                } else {
                    HStack {
                        Text(message.text ?? "")
                            .modifier(ChatMessageModifier(myMessage: false))
                        Spacer()
                    }.padding(.trailing,75)
                }
            }
        }
    }
    
    private var image: some View {
        AsyncImage(
            url: URL(string: message.imageUrl ?? "")!,
            cache: cache,
            placeholder: ShimmerView().frame(width: 291, height: 291),
            configuration: { $0.resizable().renderingMode(.original) }
        )
            .aspectRatio(contentMode: .fit)
            .frame(idealWidth: 291, idealHeight: 291)
            .cornerRadius(10)
    }
}
