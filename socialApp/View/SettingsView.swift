//
//  SettingsView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    @State var open = false
    let uid = Auth.auth().currentUser!.uid
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                Button(action: {
                    self.open.toggle()
                }) {
                    Image(systemName: "goforward")
                        .rotationEffect(.degrees(open ? 365 : 0))
                        .font(.title)
                        .frame(width: 25.0, height: 25.0)
                        .foregroundColor(Color.white)
                        .animation(.spring(response: 0.2, dampingFraction: 0.4, blendDuration: 0))
                }
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
                    if settingsData.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("ButtonLogin")))
                    }
                }
                .padding(.top, 25)
                .onTapGesture {
                    settingsData.picker.toggle()
                }
            }
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Button(action: {settingsData.updateDetails(field: "Name")}) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.bio)
                    .foregroundColor(.white)
                Button(action: {settingsData.updateDetails(field: "Bio")}) {
                    Image(systemName: "pencil.circle.fill")
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
            .padding(.top, 10)
            
            Spacer(minLength: 0)
            
        }
        .sheet(isPresented: $settingsData.picker) {
            ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
        }
        .onChange(of: settingsData.img_data) { (newData) in
            settingsData.updateImage()
        }
    }
}
