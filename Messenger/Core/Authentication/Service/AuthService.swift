//
//  AuthService.swift
//  Messenger
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 1/26/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    init() {
        self.userSession = Auth.auth().currentUser
       loadCurrentUserData()
        print("DEBUG: User session id is \(String(describing: userSession?.uid))")
    }
    @MainActor
    func login(withEmail email: String, password:String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        }
        catch {
            print("DEBUG: Failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    @MainActor

    func createUser(withEmail email: String, password:String, fullname:String, number:String ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid, number: number)
            loadCurrentUserData()
        }
        catch
        {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // backend signout
            self.userSession = nil // update routing logic
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: Failed to signout with error \(error.localizedDescription)")
        }
    }
    private func uploadUserData(email: String, fullname: String, id: String, number: String) async throws{
        let user = User(fullName: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    private func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentUser() }
    }
    
    
}




