//
//  Message.swift
//  ChatApp
//
//  Created by iOS App Templates on 03/08/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import UIKit
import FirebaseAuth

struct Message: Hashable {
    var fromId: String?
    var text : String?
    var timestamp : Int?
    var toId : String?
    var imageUrl : String?
    
    var id : String? {
        return fromId == uid ? toId : fromId
    }
    
    func chatPatnerId() -> String? {
        return fromId == uid ? fromId : toId
    }
    
    private var uid: String? {
        Auth.auth().currentUser?.uid
    }
}
