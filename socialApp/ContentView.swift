//
//  ContentView.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 25/09/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Login().preferredColorScheme(.dark)
            .navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
