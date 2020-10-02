//
//  PostView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    @State var open = false
    var body: some View {
        VStack {
            HStack {
                Text("socialApp")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                Button(action: {
                    postData.newPost.toggle()
                    self.open.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(open ? 365 : 0))
                        .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
                        .font(.title)
                        .foregroundColor(Color("ButtonLogin"))
                }
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("Background"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty {
                Spacer(minLength: 0)
                if postData.noPost {
                    Text("No Posts!")
                } else {
                    ProgressView()
                }
                
                Spacer(minLength: 0)
            } else {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(postData.posts){post in
                            PostRow(post: post, postData: postData)
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)
                }
            }
        }.fullScreenCover(isPresented: $postData.newPost) {
            NewPost(updateId: $postData.updateiD)
        }
    }
}
