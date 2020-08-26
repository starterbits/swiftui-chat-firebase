//
//  ChatsView.swift
//  ChatApp
//
//  Created by iOS App Templates on 03/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI
import UIKit

struct ChatsView: View {
    @State var messagesDictionary = [String: Message]()
    @ObservedObject var state: AppState
    @State var showNewChatsView : Bool = false
    @State var user = UserData()
    @State var activateNavigation : Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if state.messages.isEmpty {
                    Text("No Messages Found")
                        .modifier(TextModifier(font: UIConfiguration.subtitleFont))
                } else {
                    List(state.messages, id: \.id) { message in
                        ZStack {
                            NavigationLink(destination: ChatDetailedView(user: self.state.getUserFromMSG(message),
                                                                    state: self.state)) {
                                EmptyView()
                            }.hidden()
                            ChatMessageLine(user: self.state.getUserFromMSG(message),
                                            message : message)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Chats"), displayMode: .large)
            .navigationBarItems(leading: logoutButton, trailing: newChatButton
            .sheet(isPresented: $showNewChatsView) {
                NewChatsView(state: self.state)
            })
        }
    }
    
    var logoutButton: Button<Text> {
        return Button(action: state.signOut) {
            Text("Logout")
        }
    }
    
    var newChatButton: Button<Image> {
        return Button(action : newChat){
            Image(systemName: "plus")
        }
    }
    
    func newChat() {
        showNewChatsView = true
    }
    
    func getUser(_ message: Message) {
        state.getUserFromMessage(message) { (user) in
            self.user = user
            self.activateNavigation = true
        }
    }
}
