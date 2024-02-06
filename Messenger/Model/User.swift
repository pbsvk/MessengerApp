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
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
}

extension User {
    static let TEST_USER = User(fullName: "Vamsi", email: "skullerson@gmail.com", profileImageUrl: "profilePic")
}
