//
//  Register.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct Register: View {
    @State var username:String = ""
    @State var   password:String = ""
    @State var   lastname:String = ""
    @State var   email:String = ""
    
    @State private var redirectLogin = false
    
    @ObservedObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
           
                VStack{
                    
                    
                    VStack {
                        VStack(alignment: .leading){
                            
                            HStack{Spacer()}
                            Text("Get Started.")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                
                            
                            Text("Create your account")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                        }.frame( height:  260 )
                            .padding(.leading)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .clipShape(RoundedShape(corners: [.bottomRight  ]))
                             
                            
                        Spacer()
                        
                        VStack(alignment: .leading,spacing: 30,content:{
                            
                            
                            HStack{
                                Image(systemName: "person")
                                    .foregroundColor(.gray)
                                TextField(" First Name", text:  $viewModel.firstName)
                                  
                                    .background()
                                    .cornerRadius(20.0)
                                    .disableAutocorrection(true)
                                
                            }.padding()
                            
                            
                         
                            HStack{
                                Image(systemName: "person")
                                    .foregroundColor(.gray)
                                TextField("Last name", text:  $viewModel.lastName)
                                    
                                    .background()
                                    .cornerRadius(20.0)
                                    .disableAutocorrection(true)
                            }.padding()
                            
                            
                          
                            HStack{
                                Image(systemName: "envelope")
                                    .foregroundColor(.gray)
                                TextField(" Email...", text: $viewModel.email)
                                   
                                    .background()
                                   
                                    .disableAutocorrection(false)
                            }.padding()
                            
                            
                            
                            HStack{
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                SecureField("Enter password...", text: $viewModel.password)
                                    
                                    .background()
                                    .cornerRadius(20.0)
                                    .disableAutocorrection(true)
                                
                            }.padding()
                        })
                        .padding()
                        
                        VStack{
                            NavigationLink(destination: PhotoSelectorView().navigationBarBackButtonHidden(true),isActive: $redirectLogin){
                                
                                Button("Register", action: {
                                    viewModel.SignUp(user: User(firstname: viewModel.firstName, password:viewModel.password, email: viewModel.email, lastName: viewModel.lastName, image: "",calls: 0))
                                    
                                    redirectLogin=true
                                    
                                    
                                    
                                })
                                
                                .font(.headline)
                                .foregroundColor(.white)
                                    .frame(width: 340,height: 50)
                                    .background(Color(.systemBlue))
                                    .clipShape(Capsule())
                                    .padding()
                                
                                
                            }
                          
                            
                            
                            
                        }.position(x:200)
                        
                        
                        
                        
                    }.ignoresSafeArea()
                    NavigationLink(destination: Login().navigationBarBackButtonHidden(true)){
                        Text("Already have an account ?")
                    }.fontWeight(.regular)
                        .foregroundColor(.blue)
                        .frame(width: 200,height: 46)
                        .padding(.vertical)
                        .padding(.all)
                        
                        .padding()
                    
                }
            
                
            }
        }}

    


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
