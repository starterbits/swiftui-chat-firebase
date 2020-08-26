//
//  ImageModifier.swift
//  ChatApp
//
//  Created by Duy Bui on 8/26/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import SwiftUI

extension Image {
    func avatarModifier() -> some View {
        self.resizable()
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .padding(.vertical, 20)
    }
}
