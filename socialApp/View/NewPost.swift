//
//  NewPost.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 29/09/2020.
//

import SwiftUI

struct NewPost: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button(action: { present.wrappedValue.dismiss() }) {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(Color("ButtonLogin"))
                }
                
                Spacer(minLength: 0)
                
                Button(action: {newPostData.picker.toggle()}) {
                    Image(systemName: "photo.fill")
                        .font(.title)
                        .foregroundColor(Color("ButtonLogin"))
                }
                
                Button(action: {newPostData.post(present: present)}) {
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("ButtonLogin"))
                        .clipShape(Capsule())
                }
            }
            .padding()
            .opacity(newPostData.isPosting ? 0.5 : 1)
            .disabled(newPostData.isPosting ? true : false)
            
            TextEditor(text: $newPostData.postTxt)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            if newPostData.img_Data.count != 0 {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    Image(uiImage: UIImage(data: newPostData.img_Data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                        .cornerRadius(15)
                    
                    Button(action: {newPostData.img_Data = Data(count: 0)}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color("ButtonLogin"))
                            .clipShape(Circle())
                    }
                }
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color("Background").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $newPostData.picker) {
            ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
        }
    }
}
