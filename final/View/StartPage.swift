//
//  StartPage.swift
//  final
//
//  Created by  on 26/11/2022.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        NavigationView {
        ZStack{
            
         
                
            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .bottom).ignoresSafeArea()
           
                VStack{
                    Image("logo")
                        .resizable()
                    
                        .frame(width:200,height: 200)
                
                    
                    Text("Welcome").font(.system(size: 45, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
    
                    Text("come on ,let's get the best buisness experience from your country").font(.system(size: 22, weight: .none, design: .serif))
                        .foregroundColor(.white)
                        .opacity(0.8)
                    
                        .padding()
                    Spacer()
                    VStack{
                        NavigationLink(destination: Login().navigationBarBackButtonHidden(true)){
                            Text("LOGIN")
                            }.fontWeight(.heavy)
                            .foregroundColor(.red)
                            .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(.white)
                            .clipShape(Capsule())
                        NavigationLink(destination: Register().navigationBarBackButtonHidden(true)){
                            Text("GET REGISTERD")
                            }.fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                        
                       
                    }
                    
                }
            }
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
