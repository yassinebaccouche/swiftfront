//
//  posts.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct CommentsView: View {
    var comment : Comments
    @State private var showCommentsRowView = false
    
 
    
    @ObservedObject var commentViewModel = CommentViewModel()
    var body: some View {
        VStack(alignment: .leading){
            //profile image+user info +tweets
            HStack(alignment: .top, spacing: 12){
                AsyncImage(url: URL(string: "http://localhost:5001/img/"+comment.userImage),  content:{ image in
                    image  .resizable()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                },placeholder: { })
                //user info and quick caption
                VStack(alignment: .leading, spacing:4){
                    HStack{
                        Text(comment.userName)
                            .font(.subheadline).bold()
                        Text("@entrepreneur")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2sec")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .padding()
                    Text(comment.com)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
            }
            //action button
            HStack{
                
               
                    
                Button {
                    //action goes here
                }label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
               
            
                
            } .padding()

     Divider()
                .foregroundColor(.gray)
        }
       
            
            
          
            
            
        }
        
    
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
    CommentsView(comment: Comments(com: ""))
       
    }
}
