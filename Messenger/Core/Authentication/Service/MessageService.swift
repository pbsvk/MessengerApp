//
//  MessageService.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/28/24.
//

import Foundation
import Firebase

struct MessageService {
    
   static let messagesCollection = Firestore.firestore().collection("messages")
    
   static func sendMessage(_ messagetext:String, toUser user: User){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let chatPartnerId = user.id
        
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = messagesCollection.document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId,
                              fromId: currentUid,
                              toId: chatPartnerId,
                              messageText: messagetext,
                              timestamp: Timestamp()
                            )
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        
    }
}
