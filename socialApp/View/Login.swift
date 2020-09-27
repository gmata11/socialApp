//
//  Login.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 25/09/2020.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }.padding()
            
            HStack(spacing: 15) {
                TextField("+34", text: $loginData.code)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 65)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
                
                TextField("678123456", text: $loginData.number)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            if loginData.isLoading {
                ProgressView()
                    .padding()
            } else {
                HStack {
                    Button(action: loginData.verifyUser, label: {
                        Text("Verify")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color("ButtonLogin"))
                            .clipShape(Capsule())
                    })
                    .disabled(loginData.code == "" || loginData.number == "" ? true : false)
                    .opacity((loginData.code == "" || loginData.number == "" ? 0.5 : 1))
                }
            }
            
            Spacer(minLength: 20)
            
            HStack {
                Text("Created by gmata")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }.padding()
            
        }.background(Color("Background").ignoresSafeArea(.all, edges: .all))
        
        .alert(isPresented: $loginData.error) { () -> Alert in
            Alert(title: Text("Error"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("OK")))
        }
        .fullScreenCover(isPresented: $loginData.registerUser, content: {
            Register()
        })
    }
}
