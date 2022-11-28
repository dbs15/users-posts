//
//  PostViewModel.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    
    @Published var postsAll = [Post]()
    @Published var errorMessage = ""
    @State var postData = SaveDataPost()
    var headers = Headers()
    
    init () {
        let url = URL(string: ConstantsConfiguration.urlApi+ConstantsConfiguration.endPointPost)!
        let request = headers.headers(url: url, method: ConstantsConfiguration.httpGet)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let _ = error {
                self.errorMessage = ConstantsText.errorConnection
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let itemDataModel = try! JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.postsAll = itemDataModel
                    
                    for post in self.postsAll {
                        if (!self.postData.validate(id: post.id, idUser: post.userId, title: post.title, body: post.body)){
                            self.postData.saveData(idPost: post.id, idUser: post.userId, title: post.title, body: post.body)
                        }
                        print(self.postData.getDataPost(idPost: post.id))
                    }
                    
                }
            } else if let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 500 {
                self.errorMessage = ConstantsText.errorInternal
            }
        }
        task.resume()
    }
}
