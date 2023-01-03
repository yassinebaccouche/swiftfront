//
//  ProfileView.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var postViewModel = PostsViewModel()
    @State var firstName:String = LoginViewModel.currentUser?.firstName ?? ""
@State var idu:String = LoginViewModel.currentUser?.id ?? ""

    @State var lastName:String = LoginViewModel.currentUser?.lastName ?? ""
    
  
    @State var image: String = LoginViewModel.currentUser?.image ?? ""
    @State var calls: Int = (LoginViewModel.currentUser?.calls ?? 1000)


    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    @Environment(\.presentationMode) var prentmode:Binding<PresentationMode>
    
    @State private var selectedFilter : PostsFilterModelView = .posts
@Namespace var animation
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButton
            userinfodetails
            postsfilterbar
            postsview
         
            Spacer()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button{
                    self.prentmode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width:20 ,height: 16)
                        .foregroundColor(.white)
                        .offset(x:16,y:12)
                    
                    
                }
                AsyncImage(url: URL(string: "http://localhost:5001/img/"+image),  content:{ image in
                    image  .resizable()
                        .frame(width: 70,height: 70)
                        .clipShape(Circle())
                },placeholder: { })
                
            }
        }.frame(height: 96)
    }
    
    
    var actionButton : some View{
        HStack (spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            NavigationLink{
                EditProfileView().navigationBarBackButtonHidden(true)
                
                
            }label: {
                
                Text( "Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width:120 ,height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
                
                
            }
            
            
        }.padding(.trailing)
        
    }
    var userinfodetails :some View{
        VStack(alignment: .leading , spacing: 4){
            HStack{
                Image("calls") .resizable()
                    .frame(width: 30,height: 30)
                    .clipShape(Circle())
                
                Text(String (calls))
            }
            HStack{
                Text(firstName+" "+lastName)
                
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@"+firstName)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Owner of a billion dollar company " )
                .font(.subheadline)
                .padding(.vertical)
            NavigationLink(destination: ChatsSwiftUIView(), label:{ Text("chat")})
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("ennasr,TN")
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.EntrpriseName.com")
                    
                }
            }.font(.caption)
                .foregroundColor(.gray)
            UserStatsView()
                .padding(.vertical)
            
        }
        .padding(.horizontal)
        
    }
    var postsfilterbar :some View{
        HStack{
            ForEach (PostsFilterModelView.allCases, id: \ .rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline )
                        .fontWeight(selectedFilter == item ? .semibold: .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                        
                    }
                    
                    
                    
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        
        
        .overlay(Divider().offset(x:0,y:16))
        
    }
    
    var postsview: some View{
        ScrollView{
            VStack(spacing:20.0){
                ForEach(0..<postViewModel.postes.count , id: \.self ) { item in
                    CreatePosts(post: postViewModel.postes[item])
                }.padding(.trailing)
                
            }
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .onAppear{
                 print("$$$$$$$"+(LoginViewModel.currentUser?.id)!)
                postViewModel.getPostsbyUsers(id: (LoginViewModel.currentUser?.id)!, complited: {(success , respnse)in
                    if success{
                        postViewModel.postes = respnse!
                        print("0000", postViewModel.postes)
                    }else {
                        print("1111 ")
                    }
                    
                })
            }
    }
    
    
}
        
    

