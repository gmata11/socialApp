//
//  UploadImage.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 26/09/2020.
//

import SwiftUI
import Firebase

func UploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()) {
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        if err != nil {
            completion("")
            return
        }
        
        storage.child(path).child(uid).downloadURL { (url, err) in
            if err != nil {
                completion("")
                return
            }
            completion("\(url!)")
        }
    }
}
