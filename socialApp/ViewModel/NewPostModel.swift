//
//  NewPostModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI
import Firebase

class NewPostModel: ObservableObject {
    @Published var postTxt = ""
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    @Published var isPosting = false
    let uid = Auth.auth().currentUser!.uid
    
    func post(updateId: String, present: Binding<PresentationMode>) {
        isPosting = true
        if updateId != "" {
            ref.collection("Posts").document(updateId).updateData([
                "title": postTxt
            ]) { (err) in
                self.isPosting = false
                if err != nil { return }
                present.wrappedValue.dismiss()
            }
            return
        }
        if img_Data.count == 0 {
            ref.collection("Posts").document().setData([
                "title": self.postTxt,
                "url": "",
                "ref": ref.collection("Users").document(self.uid),
                "time": Date()
            ]) { (err) in
                if err != nil {
                    self.isPosting = false
                    return
                }
                self.isPosting = false
                present.wrappedValue.dismiss()
            }
        } else {
            UploadImage(imageData: img_Data, path: "post_Pics") { (url) in
                ref.collection("Posts").document().setData([
                    "title": self.postTxt,
                    "url": url,
                    "ref": ref.collection("Users").document(self.uid),
                    "time": Date()
                ]) { (err) in
                    if err != nil {
                        self.isPosting = false
                        return
                    }
                    self.isPosting = false
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
}
