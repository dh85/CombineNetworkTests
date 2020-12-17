//
//  APIError.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Foundation

enum APIError: Error {
    case unauthorized
    case serverError
    case badURL
    case decoding
    case unknown
    case redirect
}
