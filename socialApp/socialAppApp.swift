//
//  socialAppApp.swift
//  socialApp
//
//  Created by Gerard Mata Carrera on 25/09/2020.
//

import SwiftUI
import Firebase

@main
struct socialAppApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Inicialitzacio

class Appdelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
