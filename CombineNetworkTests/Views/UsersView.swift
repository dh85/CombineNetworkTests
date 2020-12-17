//
//  UsersView.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import SwiftUI
import Combine

struct UsersView: View {
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
        }
        .onAppear(perform: viewModel.fetchUsers)
        .alert(isPresented: $viewModel.showingErrorAlert) {
            Alert(title: Text("Error"), dismissButton: .cancel())
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
