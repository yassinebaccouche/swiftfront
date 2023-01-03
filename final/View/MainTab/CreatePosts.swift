//
//  posts.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct CreatePosts: View {
    var post : Posts
    @State private var showCommentsRowView = false
    @Environment(\.presentationMode) var prentmode:Binding<PresentationMode>
    @ObservedObject var postViewModel = PostsViewModel()
    var body: some View {
        VStack(alignment: .leading){
            //profile image+user info +tweets
            HStack(alignment: .top, spacing: 12){
                AsyncImage(url: URL(string: "http://localhost:5001/img/"+post.userImage),  content:{ image in
                    image  .resizable()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                },placeholder: { })
                //user info and quick caption
                VStack(alignment: .leading, spacing:4){
                    HStack{
                        Text(post.userName)
                            .font(.subheadline).bold()
                        Text("@entrepreneur")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2sec")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text(post.Title)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
            }
            //action button
            HStack{
                Button {
                
                        
                    showCommentsRowView.toggle()
                        
                    
                }label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                } .fullScreenCover(isPresented: $showCommentsRowView){
                    CommentsRowView().navigationBarBackButtonHidden(false)
                }
                Spacer()
                Button {
                    //action goes here
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action goes here
                }label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action goes here
                }label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            
                
            } .padding()
              
            
        

     Divider()
                .foregroundColor(.gray)
        }
       
            
            
          
            
            
        }
        
    
}

struct posts_Previews: PreviewProvider {
    static var previews: some View {
        CreatePosts(post: Posts(Title: "",idUser: "",userName: "",userImage: "",usercalls: 0 ))
    }
}
