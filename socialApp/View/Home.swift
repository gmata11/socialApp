//
//  Home.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 27/09/2020.
//

import SwiftUI
import Firebase

struct Home: View {
    @State var selectedTab = "Posts"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            ZStack {
                PostView()
                    .opacity(selectedTab == "Posts" ? 1 : 0)
                SettingsView()
                    .opacity(selectedTab == "Settings" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, edges!.bottom == 0 ? 15 : 30)
        }
        .background(Color("Background")).ignoresSafeArea(.all, edges: .all)
        .ignoresSafeArea(.all, edges: .top)
    }
}
