//
//  UserViewModel.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var usersAll = [UserElement]()
    @Published var errorMessage = ""
    @State var userdata = SaveDataUser()
    var headers = Headers()
    
    init () {
        let url = URL(string: ConstantsConfiguration.urlApi+ConstantsConfiguration.endPointUsers)!
        let request = headers.headers(url: url, method: ConstantsConfiguration.httpGet)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let _ = error {
                self.errorMessage = ConstantsText.errorConnection
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let itemDataModel = try! JSONDecoder().decode([UserElement].self, from: data)
                DispatchQueue.main.async {
                    self.usersAll = itemDataModel
                    
                    for user in self.usersAll {
                        if (!self.userdata.validate(id: user.id, name: user.name, phone: user.phone, mail: user.email)){
                            self.userdata.saveData(idUser: user.id, name: user.name, phone: user.phone, email: user.email)
                        }
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
