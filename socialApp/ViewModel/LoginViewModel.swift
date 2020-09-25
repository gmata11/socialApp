//
//  LoginViewModel.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 25/09/2020.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var code = ""
    @Published var number = ""
    @Published var errorMsg = ""
    @Published var error = false
    
    func verifyUser() {
        
    }
}
