//
//  PostsViewModel.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Combine

class PostsViewModel: ObservableObject {
    @Published private(set) var posts = [Post]()
    @Published var showingErrorAlert = false
    
    static let tag = "PostsView"
    
    private let apiService: APIService
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers() {
        apiService.fetchPosts()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    switch error {
                    case .unauthorized:
                        print("Unauthorized")
                    default:
                        print("Other error")
                    }
                    self?.showingErrorAlert = true
                case .finished: break
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
}
