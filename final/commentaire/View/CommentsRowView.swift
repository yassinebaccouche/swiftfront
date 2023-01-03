//
//  CommentsRowView.swift
//  final
//
//  Created by baccoucheyessin on 13/12/2022.
//

import SwiftUI

struct CommentsRowView: View {
    
    @State private var com=""
    @State private var showNewCommentView = false
    @ObservedObject var viewModel = CommentViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack(){
                        ForEach(0..<viewModel.comments.count,id : \.self){  item in
                            CommentsView(comment: viewModel.comments [item])
                                .padding()
                            
                        }
                    }
                    } .swipeActions(edge: .leading, allowsFullSwipe: true)
                   
                    {NavigationLink(destination: FirstPageView().navigationBarBackButtonHidden(false)){
                        HStack{
                            Image(systemName: "trash")
                            Text("Delete")
                            
                        }
                        
                    }.tint(.blue)
                    }
                HStack{
                        
                NewCommentView()
                        
            }
                        
                }
            }
        
        }
                  
        
        
    }
    


struct CommentsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsRowView()
    }
}
