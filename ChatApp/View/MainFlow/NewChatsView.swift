//
//  NewChatsView.swift
//  ChatApp
//
//  Created by iOS App Templates on 03/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct NewChatsView: View {
    @ObservedObject var state : AppState
    var body: some View {
        NavigationView{
            List(state.users) { user in
                NavigationLink(destination: ChatDetailedView(user: user,
                                                        state: self.state)) {
                    Text(user.name ?? "Unknown")
                }
            }.navigationBarTitle(Text("New Chat"), displayMode: .inline)
        }
    }
}


