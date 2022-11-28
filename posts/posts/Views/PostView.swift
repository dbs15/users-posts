//
//  PostView.swift
//  posts
//
//  Created by David Baena Sierra on 27/11/22.
//

import SwiftUI

struct PostsView: View {
    @StateObject var postsViewModel = PostViewModel()
    @State var postData = SaveDataPost()
    @Binding var idPost : String
    @Binding var id: Int
    
    var body: some View {
        VStack {
                ScrollView {
                    
                    ForEach(postsViewModel.postsAll, id: \.self){
                        post in
                        if (id == post.userId){
                            GroupBox{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(postData.getDataPost(idPost: post.id)[2])
                                            .foregroundColor(.blue)
                                            .fontWeight(.bold)
                                            .padding()
                                        Text(postData.getDataPost(idPost: post.id)[3])
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }
        }
        .padding()
    }
}

