//
//  ContentView.swift
//  posts
//
//  Created by David Baena Sierra on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var usersViewModel = UserViewModel()
    @StateObject var postsViewModel = PostViewModel()
    @State var userData = SaveDataUser()
    @State var show = false
    @State var id = 0
    @State var idString = ""
    @State var searchText = ""
    var body: some View {
        
        NavigationView{
                List {
                    ForEach(usersViewModel.usersAll, id: \.self){
                        user in
                        GroupBox{
                            HStack{
                                Image(systemName: "person.circle")
                                    .imageScale(.large)
                                VStack(alignment: .leading){
                                    Text(userData.getDataUser(idUser: user.id)[1])
                                    Text(userData.getDataUser(idUser: user.id)[2])
                                    Text(userData.getDataUser(idUser: user.id)[3])
                                    Button {
                                        id = user.id
                                        idString = "\(user.id)"
                                        print(user.id)
                                        show = true
                                    } label: {
                                        Label(ConstantsText.viewPosts, systemImage: ConstantsText.ImeageViewPosts)
                                    }
                                    .sheet(isPresented: $show) {
                                        PostsView(idPost: $idString, id: $id)
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                

                                
                            }
                            .padding()
                        }
                        
                        
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Users And Posts")
                
            
              
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
