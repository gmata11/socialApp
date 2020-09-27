//
//  RegisterViewModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 26/09/2020.
//

import SwiftUI
import Firebase

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    @Published var image_data = Data(count: 0)
    @Published var picker = false
    let ref = Firestore.firestore()
    @Published var isLoading = false
    @AppStorage("current_status") var status = false
    
    func register() {
        isLoading = true
        let uid = Auth.auth().currentUser!.uid
        UploadImage(imageData: image_data, path: "profile_photos") { (url) in
            self.ref.collection("Users").document(uid).setData([
                "uid": uid,
                "imageurl": url,
                "username": self.name,
                "bio": self.bio,
                "dateCreated": Date()
            ]) { (err) in
                if err != nil {
                    self.isLoading = false
                    return
                }
                self.isLoading = false
                self.status = true
            }
        }
    }
}


