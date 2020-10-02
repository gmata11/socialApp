//
//  PostViewModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI
import Firebase

class PostViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var noPost = false
    @Published var newPost = false
    let ref = Firestore.firestore()
    
    init() {
        getAllPosts()
    }
    
    func getAllPosts() {
        ref.collection("Posts").addSnapshotListener { (snap, err) in
            guard let docs = snap else {
                self.noPost = true
                return
            }
            if docs.documentChanges.isEmpty {
                self.noPost = true
                return
            }
            docs.documentChanges.forEach { (doc) in
                if doc.type == .added {
                    let title = doc.document.data()["title"] as! String
                    let time = doc.document.data()["time"] as! Timestamp
                    let pic = doc.document.data()["url"] as! String
                    let userRef = doc.document.data()["ref"] as! DocumentReference
                    
                    fetchUser(uid: userRef.documentID) { (user) in
                        self.posts.append(PostModel(id: doc.document.documentID, title: title, pic: pic, time: time.dateValue(), user: user))
                        self.posts.sort { (p1,p2) -> Bool in
                            return p1.time > p2.time
                        }
                    }
                }
                
                if doc.type == .removed {
                    let id = doc.document.documentID
                    self.posts.removeAll { (post) -> Bool in
                        return post.id == id
                    }
                }
            }
        }
    }
    
    func deletePost(id: String) {
        ref.collection("Posts").document(id).delete { (err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
        }
    }
    
    func editPost(id: String) {
        
    }
}
