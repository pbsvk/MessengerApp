//
//  Message.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/28/24.
//

import Foundation

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String{
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}
