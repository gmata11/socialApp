//
//  PostRow.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostRow: View {
    var post: PostModel
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                WebImage(url: URL(string: post.user.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(post.user.username)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer(minLength: 0)
                Menu(content: {
                    Text("Edit")
                    Text("Delete")
                }, label: {
                    Image("menu")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                })
            }
            
            if post.pic != "" {
                WebImage(url: URL(string: post.pic))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                    .cornerRadius(15)
            }
            
            HStack {
                Text(post.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(15)
    }
}
