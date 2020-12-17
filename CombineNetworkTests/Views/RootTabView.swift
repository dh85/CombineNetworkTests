//
//  RootTabView.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import SwiftUI

struct RootTabView: View {
    @SceneStorage("selectedView") var selectedView: String?
    
    var body: some View {
        TabView(selection: $selectedView) {
            UsersView()
                .tag(UsersViewModel.tag)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Users")
                }
            
            PostsView()
                .tag(PostsViewModel.tag)
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Posts")
                }
            
            SettingsView()
                .tag(SettingsViewModel.tag)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
