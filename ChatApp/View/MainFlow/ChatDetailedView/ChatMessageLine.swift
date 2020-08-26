//
//  ChatRow.swift
//  ChatApp
//
//  Created by iOS App Templates on 03/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct ChatMessageLine: View {
    var user : UserData
    var message : Message
    
    @Environment(\.imageCache) var cache: ImageCache
    
    var body : some View {
        HStack{
            profilePicture.padding(.trailing,10)
            VStack(alignment: .leading, spacing: 3){
                HStack{
                    Text(user.name ?? "")
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                    Text("\(message.timestamp?.timeStringConverter ?? "")")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.blue)
                }
                Text(message.text ?? "")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var profilePicture: some View {
        AsyncImage(
            url: URL(string: user.profileImageUrl ?? ""),
            cache: cache,
            placeholder: Image(systemName: "person.fill").frame(height: 56),
            configuration: { $0.resizable().renderingMode(.original) }
        )
            .aspectRatio(contentMode: .fit)
            .frame(height: 56)
            .clipShape(Circle())
    }
}


