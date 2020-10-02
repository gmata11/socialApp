//
//  SplashScreenView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 02/10/2020.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var isActive = false
    @State var animation = true
    @AppStorage("current_status") var status = false
    
    var body: some View {
        ZStack() {
            if self.isActive {
                NavigationView {
                    VStack {
                        if status { Home() }
                        else { Login() }
                    }
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
                }
            }else {
                Color("Background").edgesIgnoringSafeArea(.all)
                ZStack {
                    Image("GMC")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .shadow(color: Color.gray, radius: 10)
                        .scaleEffect(animation ? 0.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.0))
                        .onAppear { self.animation.toggle() }
                    
                }
                ZStack {
                    Text("Created by GMATA")
                        .frame(width: 150, height: 400, alignment: .bottomLeading)
                        .foregroundColor(.white)
                }
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

