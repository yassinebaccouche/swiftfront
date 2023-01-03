//
//  NewPostsView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct NewPostsView: View {
    @ObservedObject var viewModel = PostsViewModel()
    @State var image: String = LoginViewModel.currentUser?.image ?? ""
  
    @State private var Title=""
    @Environment(\.presentationMode) var prentmode:Binding<PresentationMode>
    var body: some View {
        
            NavigationView{
                VStack{
                    HStack{
                        Button{
                        print("Dissmiss")
                            self.prentmode.wrappedValue.dismiss()
                    }label: {
                        Text("Cancel")
                            .foregroundColor(Color(.systemBlue))
                    }
                        Spacer()
                        NavigationLink{
                            FirstPageView().navigationBarBackButtonHidden(true)
                            
                        }label: {
                            Button{
                                
                                viewModel.CREATEPOST(post:Posts(Title:Title,idUser: (LoginViewModel.currentUser?.id)!,userName: (LoginViewModel.currentUser?.firstName)!,
                                                            userImage: (LoginViewModel.currentUser?.image)!,
                                                                usercalls: (LoginViewModel.currentUser?.calls)!-10))
                                //self.prentmode.wrappedValue.dismiss()

                                
                            }label: {
                                Text(" Post")
                                    .bold()
                                    .padding(.horizontal)
                                    .padding(.vertical,8)
                                    .background(Color(.systemBlue))
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }

                        }
                    }
                    .padding()
                    
                    HStack(alignment: .top){
                        AsyncImage(url: URL(string: "http://localhost:5001/img/"+image),  content:{ image in
                            image  .resizable()
                                .frame(width: 50,height: 50)
                                .clipShape(Circle())
                        },placeholder: { })
                        TextAreaView("WWWWWWWWWWWWWW", text: $Title)
                    }
                    .padding(8)
                }
            
        }
            }
}

struct NewPostsView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostsView()
    }
}
