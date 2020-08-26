//
//  ContentView.swift
//  ChatApp
//
//  Created by iOS App Templates on 02/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct RouterView: View {
    @EnvironmentObject var state : AppState
    
    var body: some View {
        Group {
            if (state.currentUser != nil) {
                ChatsView(state: state)
            }
            else {
                WelcomeView()
            }
        }.onAppear(perform: state.listen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView().environmentObject(AppState())
    }
}
