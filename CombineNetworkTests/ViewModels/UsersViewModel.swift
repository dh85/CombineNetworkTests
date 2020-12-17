//
//  UsersViewModel.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Combine

class UsersViewModel: ObservableObject {
    @Published private(set) var users = [User]()
    @Published var showingErrorAlert = false
    
    static let tag = "UsersView"
    
    private let apiService: APIService
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchUsers() {
        apiService.fetchUsers()
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
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
