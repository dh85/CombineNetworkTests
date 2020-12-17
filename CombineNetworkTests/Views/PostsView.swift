//
//  PostsView.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import SwiftUI

struct PostsView: View {
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                PostCell(with: post)
            }
            .navigationTitle("Posts")
        }
        .onAppear(perform: viewModel.fetchUsers)
        .alert(isPresented: $viewModel.showingErrorAlert) {
            Alert(title: Text("Error"), dismissButton: .cancel())
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
