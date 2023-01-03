//
//  ForgotPass.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct ForgotPass: View {
    @ObservedObject var vi = LoginViewModel()
    @State private var email = ""
    
    @State private var isShowingRegisterView = false
    var body: some View {
        NavigationView {
        ZStack{  LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .leading, endPoint: .bottom).ignoresSafeArea()
            VStack{
                Text("Verify Email").font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(.black)
                
                Text("Please enter your email adresse")
                    .font(.headline.bold())
                    .opacity(0.5)
                
                    .padding(.vertical)
                    .position(x:170)
                VStack{
                    Text(" Enter a verified Email adress")
                        .foregroundColor(Color.red)
                        .font(.headline)
                        .fontWeight(.bold)
                        .opacity(0.6)
                    
                }.padding(20)
                    .position(x:130,y:180)
                VStack{
                    VStack{
                        HStack{
                            Image(systemName: "envelope")
                            TextField("Enter Email...", text: $email)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                            
                        }.position(x:150)}.padding([.leading,.trailing],27.5)
                    
                }}

            VStack{
              
                HStack{
                    NavigationLink(destination: Codepassword(email:$email).navigationBarBackButtonHidden(true),isActive: $isShowingRegisterView){
                        Button("Send", action: {
                            
                            vi.ResetPassword(email: email)
                            
                            
                            isShowingRegisterView = true
                        })}
                      
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(.blue)
                    .clipShape(Capsule())
                       
                        .position(x:190,y:650)
                        
                    }
                    
                    
                }
            }
        }
    }
    
}

struct ForgotPass_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPass()
    }
}
