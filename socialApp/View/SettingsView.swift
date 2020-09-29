//
//  SettingsView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("Background"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if settingsData.userInfo.pic != "" {
                ZStack {
                    WebImage(url: URL(string: settingsData.userInfo.pic)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                }
            }
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.bio)
                    .foregroundColor(.white)
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
            
            Button(action: settingsData.logOut, label: {
                Text("Logout")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 140)
                    .background(Color("ButtonLogin"))
                    .clipShape(Capsule())
            })
            .padding()
            
            Spacer(minLength: 0)
        }
    }
}
