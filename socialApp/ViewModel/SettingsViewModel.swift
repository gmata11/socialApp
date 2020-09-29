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
    @AppStorage("current_status") var status = false
    @Published var picker = false
    @Published var img_data = Data(count: 0)
    @Published var isLoading = false
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
        try! Auth.auth().signOut()
        status = false
    }
    
    func updateImage() {
        isLoading = true
        UploadImage(imageData: img_data, path: "profile_photos") { (url) in
            self.ref.collection("Users").document(self.uid).updateData(["imageurl" : url]) { (err) in
                if err != nil { return }
                self.isLoading = false
                self.fetchUser()
            }
        }
    }
}
