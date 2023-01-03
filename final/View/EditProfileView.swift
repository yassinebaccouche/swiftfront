//
//  EditProfileUView.swift
//  Memorize
//
//  Created by Apple Esprit on 11/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct EditProfileView: View {
    @State var firstName:String = LoginViewModel.currentUser?.firstName ?? ""
    @State var  password:String =  LoginViewModel.currentUser?.password ?? ""
    @ObservedObject var viewModel = LoginViewModel()
    @State var   verifpassword:String=""
    @State var   lastname:String = LoginViewModel.currentUser?.lastName ?? ""
    
    @State var   email:String = LoginViewModel.currentUser?.email ?? ""
    @State var  description:String = ""
    @State private var image: String = ""
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var update : Bool = true
    @State var isdisabledEmail : Bool = true
    @State var activateSecurePwd : Bool = false
    @State var logout : Bool = false
  
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), label: {Image(systemName: "arrow.backward")}).position(x:10,y:0)
                    
                    ZStack{
                        
                        VStack{}.frame(maxWidth: .infinity,maxHeight: 190).background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
                        
                        
                    }
                    
                    Spacer()
                }
              
                Image("cercle").resizable().scaledToFill().frame(width: 180,height: 180).position(x:100,y:30)
                VStack(spacing: 16){
                    HStack{
                        VStack{
                            
                            ZStack{
                                ZStack
                                {
                                    
                                    
                                    ZStack{
                                        
                                        if let selectedImage = selectedImage {
                                            
                                            Image(uiImage:selectedImage) .resizable()
                                                .cornerRadius(7)
                                                .padding(1) // Width of the border
                                                .background(Color.gray.opacity(0.10))
                                                .cornerRadius(10)
                                            
                                                .clipShape(Circle())
                                            
                                                .scaledToFit()
                                            
                                                .frame(width: 600, height: 300)
                                            
                                            
                                        }else{
                                            
                                            AsyncImage(url: URL(string: "http:/localhost:5001/img/"+(LoginViewModel.currentUser?.image ?? "")),
                                                       content:{ image in
                                                image
                                                    .resizable()
                                                    .cornerRadius(7)
                                                    .padding(1) // Width of the border
                                                    .background(Color.gray.opacity(0.10))
                                                    .cornerRadius(10)
                                                
                                                    .clipShape(Circle())
                                                
                                                    .scaledToFit()
                                                
                                                    .frame(width: 600, height: 300)
                                                
                                                
                                                
                                                
                                            },placeholder: { })
                                        }
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                Image(systemName: "camera").font(.system(size: 40, weight:.medium)).foregroundColor(Color(.systemBlue)).onTapGesture {
                                                    self.showImagePicker = true
                                                }.position(x:350,y: 230)
                                                
                                            }
                                        }
                                    }.foregroundColor(Color(.systemBlue))
                                       
                                }
                                .onChange(of: self.selectedImage)
                                { newVal in
                                    self.selectedImage = newVal
                                }.onAppear
                                {
                                    self.selectedImage = nil
                                }
                                
                                
                                
                            }.frame(width:350,height: 200)
                            Menu {
                                
                                Button(action: {
                                    
                                    
                                    LoginViewModel.currentUser?.email = email
                                    LoginViewModel.currentUser?.firstName = firstName
                                    LoginViewModel.currentUser?.lastName = lastname
                                    
                                    viewModel.updateUser(user: LoginViewModel.currentUser!, image: selectedImage!)
                                    
                                    
                                    
                                    
                                }) {
                                    Label {
                                        Text("Update")
                                    } icon: {
                                        Image(systemName: "arrow.up.to.line.circle")
                                    }
                                }
                                
                                Button(action: {
                                    
                                    
                                }) {
                                    Label {
                                        Text("Delete")
                                    } icon: {
                                        Image(systemName: "delete.backward")
                                    }
                                }
                                
                            } label: {
                                Image(systemName: "menucard")
                                    .font(.title)
                                    .tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                                
                                
                            }.position(x:350,y: -50)
                        }
                        
                    }.padding(.top,55)
                   

                    
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                            ZStack(alignment: .leading){
                                if lastname.isEmpty {
                                    Text("firstName").foregroundColor(Color(.systemBlue)).padding()
                                }
                                TextField("", text: $firstName).foregroundColor(Color(.systemBlue)).padding()
                            }
                            
                        }.frame(width:350, height: 50).padding(.top,16)
                        ZStack{
                            RoundedRectangle(cornerRadius:15).stroke(Color.gray.opacity(0.5)).background(Color.black.opacity(0.1)).cornerRadius(15)
                            ZStack(alignment: .leading){
                                if lastname.isEmpty {
                                    Text("lastname").foregroundColor(Color(.systemBlue)).padding()
                                }
                                TextField("", text: $lastname).foregroundColor(Color(.systemBlue)).padding()
                            }
                            
                        }.frame(width:350, height: 50)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                            ZStack(alignment: .leading){
                                if email.isEmpty {
                                    Text("email").foregroundColor(Color(.systemBlue)).padding()
                                }
                                TextField("", text: $email).foregroundColor(Color.blue).padding()
                            }
                            
                        }.frame(width:350, height: 50)
                        
                        
                        
                        
                        NavigationLink(destination: Login().navigationBarBackButtonHidden(true),isActive: $logout)
                        {
                        Button{
                            UITabBar.appearance().isHidden = true
                            LoginViewModel.currentUser = nil
                            logout=true
                            
                        }label: {
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                
                                .font(.title)
                                .tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                            
                            
                            
                        }
                    }.offset(x:100,y: 100)
                        
                        
                        
                       
                    }.offset(y:-170)
                    Spacer()
                    
                }
                
                
                
            }.frame(alignment: .leading).sheet(isPresented: $showImagePicker)
            {
                
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                
            }
            
            
            
        }
        
    }
        
        
        
    }
    

    
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}


