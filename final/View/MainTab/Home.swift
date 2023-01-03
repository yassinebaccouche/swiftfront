//
//  Home.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//
import SDWebImageSwiftUI
import SwiftUI

struct Home: View {
    @State private var showNewPostView = false
    @ObservedObject var postViewModel = PostsViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing){
        ScrollView{
            LazyVStack(){
                ForEach(0..<postViewModel.postes.count,id : \.self){  item in
                    CreatePosts(post: postViewModel.postes[item])
                        .padding()
                    
                }
            }
         }
            Button{
                showNewPostView.toggle()
            }label: {
                Image("logo")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 40,height: 40)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
            .fullScreenCover(isPresented: $showNewPostView){
                NewPostsView()
            }
           
          
      }
    }
 }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
