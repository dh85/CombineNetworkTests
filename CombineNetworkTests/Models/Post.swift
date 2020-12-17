//
//  Post.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
