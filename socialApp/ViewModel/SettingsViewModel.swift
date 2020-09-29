//
//  SettingsViewModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI
import Firebase

class SettingsViewModel: ObservableObject {
    @Published var userInfo = UserModel(username: "", pic: "", bio: "")
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        ref.collection("Users").document(uid).getDocument { (doc, err) in
            guard let user = doc else { return }
            let username = user.data()?["username"] as! String
            let pic = user.data()?["imageurl"] as! String
            let bio = user.data()?["bio"] as! String
            
            DispatchQueue.main.async {
                self.userInfo = UserModel(username: username, pic: pic, bio: bio)
            }
        }
    }
    
    func logOut() {
        
    }
}
