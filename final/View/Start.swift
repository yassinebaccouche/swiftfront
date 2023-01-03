//
//  Start.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

import SwiftUI

struct Start: View {
    var body: some View {
        NavigationView {
            ZStack{
                
                
                
                LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .bottom).ignoresSafeArea()
                Image("logo")
                    .resizable()
                    .position(x:100,y: -150)
                    .frame(width:200,height: 200)
                Text("SOS ENTREPRENEUR").font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .position(x:200,y:300)
                VStack{
                    NavigationLink(destination: StartPage().navigationBarBackButtonHidden(true)){
                    Text("Click Here To Continue  ")
                    } .position(x:200,y:700)
                        .foregroundColor(.white)
              
             
                 
                }
                
            }
        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
