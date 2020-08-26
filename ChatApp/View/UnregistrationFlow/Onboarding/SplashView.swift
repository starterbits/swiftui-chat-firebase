//
//  SplashView.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State var isActive:Bool = false
    @EnvironmentObject var state : AppState
    init() {
        UITableView.appearance().tableFooterView = UIView()
    }
    var body: some View {
        VStack {
            if self.isActive {
                RouterView()
            } else {
                ZStack {
                    Color(UIConfiguration.tintColor)
                        .edgesIgnoringSafeArea(.all)
                    Image("AppIcon")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
