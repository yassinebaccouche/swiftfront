//
//  NewCommentView.swift
//  final
//
//  Created by baccoucheyessin on 13/12/2022.
//

import SwiftUI

struct NewCommentView: View {
    @State private var com=""
    @State private var showNewCommentView = false
    @ObservedObject var viewModel = CommentViewModel()
    
    @State private var Comment=""
    var body: some View {
        HStack{
            VStack{
                
                
                TextAreaView("Enter your comment",text: $com)
            }
            .frame(height: 100)
            .background(Color(.systemGray6))
            
        }
        VStack{
            NavigationLink{
                FirstPageView().navigationBarBackButtonHidden(false)
                
            }label: {
                Button{
                    
                    viewModel.CREATECOM(comment:Comments(com:com,idUser: (LoginViewModel.currentUser?.id)!, userName: (LoginViewModel.currentUser?.firstName)!,
                                                         userImage: (LoginViewModel.currentUser?.image)!))
                    //self.prentmode.wrappedValue.dismiss()
                    
                    
                }label: {
                    Text(" Comment")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                }}
        }
        
        
    }}

struct NewCommentView_Previews: PreviewProvider {
    static var previews: some View {
        NewCommentView()
            
    }
}
