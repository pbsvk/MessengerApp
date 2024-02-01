//
//  InboxService.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/31/24.
//

import Foundation
import Firebase

class InboxService{
    
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreConstants
            .MessageCollection
            .document(uid).collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            })
            
            else { return }
            self.documentChanges = changes
        }
        
    }
}
