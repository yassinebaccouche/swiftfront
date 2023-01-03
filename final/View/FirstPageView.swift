//
//  FirstPageView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct FirstPageView: View {
    @State private var showMenu = false
    @State var image: String = LoginViewModel.currentUser?.image ?? ""
    var body: some View {
        ZStack(alignment:.topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu=false
                    }
                }
            }
            
            SideMenuView()
            
                .frame(width:300)
                .offset(x:showMenu ? 0 : -300, y:0)
                .background(showMenu ? Color.white : Color.clear)
            
        }
       
            
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem (placement : .navigationBarLeading)
            {
                Button{
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                }label: {
                    
                    Image(systemName: "sidebar.left")


                }
            }
        }
        .onAppear{
            showMenu = false 
        }
    }
}
struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FirstPageView()
        }
        
    }
}
