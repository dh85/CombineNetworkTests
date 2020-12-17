//
//  SettingsView.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Profile")) {
                        Text(viewModel.profileText)
                    }
                    
                    Toggle(viewModel.useMobileDataText, isOn: $viewModel.isMobileDataOn)
                }
                
                Section {
                    Button(viewModel.signOutText, action: viewModel.signOut)
                        .foregroundColor(.red)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(viewModel.title)
            .alert(isPresented: $viewModel.signoutConfirmPresented, content: {
                Alert(title: Text("Signed out"), dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
