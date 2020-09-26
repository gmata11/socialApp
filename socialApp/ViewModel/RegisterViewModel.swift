//
//  RegisterViewModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 26/09/2020.
//

import SwiftUI
import Firebase

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    
    @Published var image_data = Data(count: 0)
    @Published var picker = false
    
    func register() {
        
    }
}


