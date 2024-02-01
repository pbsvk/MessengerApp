//
//  Constants.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/31/24.
//

import Foundation
import Firebase

struct FirestoreConstants
{
  static  let UserCollection = Firestore.firestore().collection("users")
   static let MessageCollection = Firestore.firestore().collection("messages")
}
