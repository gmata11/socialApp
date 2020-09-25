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
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (ID, err) in
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                return
            }
            self.alertView { (Code) in
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                Auth.auth().signIn(with: credential) { (res, err) in
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        return
                    }
                }
            }
        }
    }
    
    func alertView(completion: @escaping (String) -> ()) {
        let alert = UIAlertController(title: "Verification", message: "Enter Code", preferredStyle: .alert)
        alert.addTextField { (text) in
            text.placeholder = "123456"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: { (_) in
            let code = alert.textFields![0].text ?? ""
            if code == "" {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            completion(code)
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}
