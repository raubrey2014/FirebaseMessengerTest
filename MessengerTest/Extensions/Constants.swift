//
//  Constants.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 4/22/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import Firebase

struct Constants {
    struct refs {
        static let databaseRoot = Database.database().reference()
        static let databaseChatsKeys = databaseRoot.child("chatKeys")
        static let databaseChats = databaseRoot.child("chats")
        
    }
}
