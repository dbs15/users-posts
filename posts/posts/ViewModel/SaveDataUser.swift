//
//  SaveDataUser.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import Foundation

class SaveDataUser {
    
    var id: Int = 0
    var name : String = ""
    var phone : String = ""
    var email : String = ""

    func saveData(idUser: Int, name:String, phone:String, email:String) {
        let id = "\(idUser)"
        let user = [id, name, phone, email]
        UserDefaults.standard.set(user, forKey: "user\(id)")
        
    }
    
    func getDataUser(idUser: Int) -> [String] {
        let id = "\(idUser)"
        let user: [String] = UserDefaults.standard.stringArray(forKey: "user\(id)")!
        return user
    }
    
    func validate(id:Int, name: String, phone: String,  mail:String) -> Bool {
        let idUSer = "\(id)"
        var idSaved = ""
        var nameSaved = ""
        var phoneSaved = ""
        var mailSaved = ""
            
            
        if UserDefaults.standard.object(forKey: "user\(idUSer)") != nil {
            idSaved = UserDefaults.standard.stringArray(forKey: "user\(id)")![0]
            nameSaved = UserDefaults.standard.stringArray(forKey: "user\(id)")![1]
            phoneSaved = UserDefaults.standard.stringArray(forKey: "user\(id)")![2]
            mailSaved = UserDefaults.standard.stringArray(forKey: "user\(id)")![3]
            if (idUSer == idSaved && name == nameSaved && phone == phoneSaved && mail == mailSaved){
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
