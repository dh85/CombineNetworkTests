//
//  APIService.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Combine
import Foundation

class APIService {
    func fetchUsers() -> AnyPublisher<[User], APIError> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        return fetch(url).eraseToAnyPublisher()
    }
    
    func fetchPosts() -> AnyPublisher<[Post], APIError> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        return fetch(url).eraseToAnyPublisher()
    }
    
    func fetch<T: Decodable>(_ url: URL, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, APIError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .retry(1)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse else {
                    throw APIError.badURL
                }
                
                switch httpResponse.statusCode {
                case 200...299: return output.data
                case 300...399: throw APIError.redirect
                case 400...499: throw APIError.unauthorized
                case 500...599: throw APIError.serverError
                default: throw APIError.unknown
                }
            }
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else if error is DecodingError {
                    return APIError.decoding
                } else {
                    return APIError.unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
