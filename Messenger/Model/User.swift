//
//  User.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/20/24.
//

import Foundation
import SwiftUI
import _PhotosUI_SwiftUI
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid:String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String{
        return uid ?? NSUUID().uuidString
    }
}

extension User {
    static let TEST_USER = User(fullName: "Skullman", email: "skullerson@gmail.com", profileImageUrl: "profilePic")
}
