//
//  Codepassword.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct Codepassword: View {
    @State var Code:String = ""
    
    @Binding var email: String
    @ObservedObject var viewModel = LoginViewModel()
    @State private var isValidCode = false
    
    @State private var isShowingRegisterView = false
    var body: some View {
        VStack{
            VStack{
                Image("fp")
                    .resizable()
                
                    .frame(width:400,height: 400)
            }
            Text("Verify Email").font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(.black)
            
            Text("Please enter your 5 digits code sent to your email").font(.system(size: 16, weight: .none, design: .serif))
                .foregroundColor(.black)
                .opacity(0.5)
                .padding(10)
            Text("Code")
                .font(.callout)
                .bold()
            /*HStack{
                TextField("", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .frame(width: 50)
                
                    .multilineTextAlignment(.center)
                
                    .cornerRadius(20.0)
                TextField("", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .frame(width: 50)
                
                    .multilineTextAlignment(.center)
                
                    .cornerRadius(20.0)
                TextField("", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .frame(width: 50)
                
                    .multilineTextAlignment(.center)
                
                    .cornerRadius(20.0)
                TextField("", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .frame(width: 50)
                
                    .multilineTextAlignment(.center)
                
                    .cornerRadius(20.0)
                TextField("", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .frame(width: 50)
                
                    .multilineTextAlignment(.center)
                
                    .cornerRadius(20.0)
            }*/
            TextField("Enter CODE...", text: $viewModel.validateCode)
                    .padding()
                    .background(Color.gray)
                    .frame(width: 200)
                    .cornerRadius(20.0)
            HStack{
                NavigationLink(destination: ChangePasswordView(email:$email),isActive: $isValidCode){
                    Button("enter", action: {
                        
                        viewModel.ValideCode(code:viewModel.validateCode,complited: {(success ) in
                            if success {
                               
                                print("Valid email ")
                                isValidCode=true
                            }else{
                                print("try to write a valid email ")
                                isValidCode=false
                            }
                        })
                        
                    })
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 150)
                .background(.red).opacity(0.8)
                .clipShape(Capsule())
                    
                                  }
                
                
            }
            
        }
        
        
    }
}


