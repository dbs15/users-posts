//
//  Post.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import Foundation

struct PostArr: Codable {
    var posts: [Post]
}

struct Post: Codable, Hashable {
    let userId, id: Int
    let title, body: String

    
}
