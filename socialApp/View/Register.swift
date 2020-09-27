//
//  Register.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 26/09/2020.
//

import SwiftUI

struct Register: View {
    @StateObject var registerData = RegisterViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }.padding()
            
            ZStack {
                if registerData.image_data.count == 0 {
                    Image(systemName: "person")
                        .font(.system(size: 65))
                        .foregroundColor(.black)
                        .frame(width: 115, height: 115)
                        .background(Color.white)
                        .clipShape(Circle())
                } else {
                    Image(uiImage: UIImage(data: registerData.image_data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 115, height: 115)
                        .clipShape(Circle())
                }
            }
            .padding(.top)
            .onTapGesture(perform: {
                registerData.picker.toggle()
            })
            
            HStack(spacing: 15) {
                TextField("Name", text: $registerData.name)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            
            HStack(spacing: 15) {
                TextField("Bio", text: $registerData.bio)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            if registerData.isLoading {
                ProgressView()
                    .padding()
            } else {
                HStack {
                    Button(action: registerData.register, label: {
                        Text("Register")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color("ButtonLogin"))
                            .clipShape(Capsule())
                    })
                    .disabled(registerData.image_data.count == 0 || registerData.name == "" || registerData.bio == "" ? true : false)
                    .opacity((registerData.image_data.count == 0 || registerData.name == "" || registerData.bio == "" ? 0.5 : 1))
                }
            }
            
            Spacer(minLength: 20)
            
        }.background(Color("Background").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $registerData.picker, content: {
            ImagePicker(picker: $registerData.picker, img_Data: $registerData.image_data)
        })
        .preferredColorScheme(.dark)
    }
}
