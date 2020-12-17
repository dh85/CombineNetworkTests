//
//  SettingsViewModel.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Combine

final class SettingsViewModel: ObservableObject {
    @Published var isMobileDataOn = false
    @Published var signoutConfirmPresented = false
    
    static let tag = "SettingsView"
    
    var title: String {
        "Settings"
    }
    
    var profileText: String {
        "Profile"
    }
    
    var useMobileDataText: String {
        "Use mobile data"
    }
    
    var signOutText: String {
        "Sign out"
    }
    
    func signOut() {
        signoutConfirmPresented.toggle()
    }
}
