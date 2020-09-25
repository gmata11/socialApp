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
                Text("Login").font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }.padding()
            
            HStack(spacing: 15) {
                TextField("1", text: $loginData.code).padding()
                    .frame(width: 15)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
                
                TextField("678123456", text: $loginData.number).padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }.padding()
            .padding(.top, 10)
            
            Button(action: loginData.verifyUser, label: {
                Text("Verify").foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
            
            Spacer(minLength: 0)
        }.background(Color.gray.ignoresSafeArea(.all, edges: .all))
    }
}
