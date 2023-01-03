//
//  SideMenuView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct SideMenuView: View {
    @State var firstName:String = LoginViewModel.currentUser?.firstName ?? ""
    @State var lastName:String = LoginViewModel.currentUser?.lastName ?? ""
    let url = path().url
    @ObservedObject var viewModel = LoginViewModel()
    @State var image: String = LoginViewModel.currentUser?.image ?? ""
    
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 32){
            VStack(alignment: .leading){
                
                AsyncImage(url: URL(string: "http://localhost:5001/img/"+image),  content:{ image in
                    image  .resizable()
                        .frame(width: 100,height: 100)
                        .clipShape(Circle())
                },placeholder: { })
                
                
                VStack(alignment: .leading, spacing: 4){
                    Text(firstName)
                        .font(.headline)
                    Text(lastName)
                        .font(.caption)
                    
                        .foregroundColor(.gray)
                    
                }
                UserStatsView()
                    .padding(.vertical )
                
            }
            .padding(.leading)
            ForEach(SideMenuViewModel.allCases, id :\.rawValue){ viewModel in
                if viewModel == .profile{
                    NavigationLink{
                        ProfileView()
                    }label:{
                        SideMenuOptionRowView(viewModel: viewModel )
                        
                    }
                    
                }else if   viewModel == .logout {
                    NavigationLink{
                        Login()
                        
                    }label:{
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }else if viewModel == .wallet{
                    
                    SideMenuOptionRowView(viewModel: viewModel )
                }
                
                
                
            }
            
            
            Spacer()
        }
    }


}


struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

