//
//  User.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
}
