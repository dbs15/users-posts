//
//  User.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import Foundation

struct Result: Codable {
    var result : [UserElement]
}

struct Users: Codable {
    var users: [UserElement]
}

struct UserElement: Codable, Identifiable, Hashable{
    let id: Int
    let name: String
    let email: String
    let phone: String
}


