//
//  Login.swift
//  final
//
//  Created by baccoucheyessin on 26/11/2022.
//

import SwiftUI
import LocalAuthentication
import Alamofire

struct Login: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isShowingContentView = false
    @State private var isLogin = false
    @AppStorage("lastUserEmail") var lastUserEmail: String = ""
    @AppStorage("lastUserPassword") var lastUserPassword: String = ""
    var currentUser: User?
    var body: some View {
        
        NavigationView {

                
            VStack{
                
                VStack(alignment: .leading){
                    
                    HStack{Spacer()}
                    Text("Hello.")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }.frame( height:  260 )
                    .padding(.leading)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(RoundedShape(corners: [.bottomRight  ]))
                     
                    
                Spacer()
                    
                    
                    
                        
                VStack ( spacing: 40)  {
                    
                    
                    
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        
                        TextField("Email",text:$viewModel.email)
                        
                        
                        
                    }
                    
                    
                    
                    
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password" , text:$viewModel.password)
                        
                        
                        
                        
                    }
                }.padding(.horizontal,32)
                    .padding(.top,44)
                HStack{
                    Spacer()
                    NavigationLink(destination: ForgotPass().navigationBarBackButtonHidden(true)){
                        Text("Forgot Password?")
                    }.font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                    
                    
                    
                }
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: FirstPageView().navigationBarBackButtonHidden(true), isActive: $isLogin){
                                Button("Sign in", action: {
                                    
                                    viewModel.LogIn(email: viewModel.email, password: viewModel.password,complited: {(user ) in
                                        if let  _ = user {
                                            
                                            print("logged in ")
                                            isLogin=true
                                        }else{
                                            print("not loged in ")
                                            isLogin=false
                                        }
                                    })
                                    
                                }
                                )
                            }
                            
                            
                            
                            }
                        .font(.headline)
                        .foregroundColor(.white)
                            .frame(width: 340,height: 50)
                            .background(Color(.systemBlue))
                            .clipShape(Capsule())
                            .padding()
                        
                        
                        NavigationLink(destination: FirstPageView().navigationBarBackButtonHidden(true), isActive: $isLogin){
                            
                                
                                Button("FaceID") {
                                    viewModel.faceIDLogin {
                                        print("Login FaceID success")
                                        let (email, password) =                      UserManager.shared.getUserData()
                                        if email != nil && password != nil {
                                            viewModel.LogIn(email: email ?? "", password:password ?? "",complited: {(user ) in
                                                if let  _ = user {
                                                   
                                                    print("logged in ")
                                                    isLogin=true
                                                }else{
                                                    print("not loged in ")
                                                    isLogin=false
                                                }
                                            })
                                        }

                                    } completionError: {
                                        print("Login FaceID Error")
                                    }

                                }.alert(isPresented: $viewModel.errorPopUpIsDisplayed) {
                                    Alert(title: Text(viewModel.errorTitleFaceIDPopUp), message: Text(viewModel.errorMessageFaceIDPopUp), dismissButton: .default(Text(viewModel.errorOkActionFaceIDPopUp)))
                                    
                                
                            }
                            
                        }
                        
                        Button{
                                
                            
                                
                                viewModel.LogInGoogle(complited: {(user ) in
                                    if let  _ = user {
                                       
                                        print("logged in ")
                                        isLogin=true
                                    }else{
                                        print("not loged in ")
                                        isLogin=false
                                    }
                                })
                                
                                    }label: {
                                        Image("google")
                                            .resizable()
                                            .frame(width: 40,height: 40)
                                            .padding()
                                    }
                                    .clipShape(Circle())
                                    .padding()
                                    .position(x:190,y:50)
                      
                        NavigationLink(destination: Register().navigationBarBackButtonHidden(true)){
                            Text("Don't have an account ?")
                        }.fontWeight(.regular)
                            .foregroundColor(.blue)
                            .frame(width: 200,height: 46)
                            .padding(.vertical)
                            .padding(.all)
                            .position(x:150,y:60)
                            .padding()
                        
                    }
                    
                    
                
            }.ignoresSafeArea()
        }
        
        
    }
   

}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
