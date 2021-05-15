//
//  InstagramApp.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 25/04/21.
//

import SwiftUI
import Firebase

@main
struct InstagramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
