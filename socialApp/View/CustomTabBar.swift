//
//  CustomTabBar.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    var body: some View {
        HStack(spacing: 65) {
            TabButton(title: "Posts", selectedTab: $selectedTab)
            TabButton(title: "Settings", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {selectedTab = title}) {
            VStack(spacing: 5) {
                Image(title)
                    .resizable()
                    .frame(width: 22.0, height: 22.0)
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? Color("ButtonLogin") : .gray)
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}
