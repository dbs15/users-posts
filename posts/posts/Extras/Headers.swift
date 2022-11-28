//
//  Headers.swift
//  posts
//
//  Created by David Baena Sierra on 27/11/22.
//

import Foundation
class Headers: ObservableObject {
    func headers(url: URL, method: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
