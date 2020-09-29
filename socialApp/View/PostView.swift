//
//  PostView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View {
        VStack {
            HStack {
                Text("socialApp")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(Color("ButtonLogin"))
                }
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("Background"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            Spacer(minLength: 0)
        }
    }
}
