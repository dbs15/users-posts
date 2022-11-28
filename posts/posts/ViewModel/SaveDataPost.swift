//
//  SaveDataPost.swift
//  posts
//
//  Created by David Baena Sierra on 27/11/22.
//

import Foundation

class SaveDataPost {
    
    var id: Int = 0
    var userId : Int = 0
    var title : String = ""
    var body : String = ""

    func saveData(idPost: Int, idUser:Int,  title:String, body:String) {
        let id = "\(idPost)"
        let userId = "\(idUser)"
        let post = [id, userId, title, body]
        UserDefaults.standard.set(post, forKey: "postUser\(id)")
       print(post)
    }
    
    func getDataPost(idPost:Int) -> [String] {
        
            let id = "\(idPost)"
        let post: [String] = UserDefaults.standard.stringArray(forKey: "postUser\(id)") ?? [""]
            
           return post
        
    }
    
    func validate(id: Int, idUser:Int,  title:String, body:String) -> Bool {
        let idPost = "\(id)"
        let idUserPost = "\(idUser)"
        var idPostSaved = ""
        var idUserSaved = ""
        var titleSaved = ""
        var bodySaved = ""
            
        if UserDefaults.standard.object(forKey: "post\(id)") != nil {
            
            idPostSaved = UserDefaults.standard.stringArray(forKey: "post\(id)")![0]
            idUserSaved = UserDefaults.standard.stringArray(forKey: "post\(id)")![1]
            titleSaved = UserDefaults.standard.stringArray(forKey: "post\(id)")![2]
            bodySaved = UserDefaults.standard.stringArray(forKey: "post\(id)")![3]
            
            if (idPost == idPostSaved && idUserPost == idUserSaved && title == titleSaved && body == bodySaved){
                return true
            }else{
                return false
            }
              
        }else{
            
            print("No hay datos de usuario grabados en el objeto global de userdefaults")
            return false
        }
        
    }

    
    
}

