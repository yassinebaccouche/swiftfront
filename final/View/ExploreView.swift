//
//  ExploreView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchtext = ""
    @ObservedObject var loginViewModel = LoginViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                SearchBar(text: $searchtext)
                    .padding(.top)
                ScrollView{
                    LazyVStack{
                        ForEach(0..<loginViewModel.users.count,id : \.self){  item in
                            UserRowView(user: loginViewModel.users[item])
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        
    }


struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
