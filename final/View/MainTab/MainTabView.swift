//
//  MainTabView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex  = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            Home()
                .onTapGesture {
                    self.selectedIndex = 0
                    
                }
                .tabItem{
                    Image(systemName: "house")
                }.tag(0)
            
         ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                    
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                    
                }
                .tabItem{
                    Image(systemName: "globe.europe.africa")
                }.tag(2)
            StocksApp()
                .onTapGesture {
                    self.selectedIndex = 3
                    
                }
                .tabItem{
                    Image(systemName: "envelope")
                }.tag(4)
            ShopView()
                 .onTapGesture {
                     self.selectedIndex = 5
                 }
                 .tabItem{
                     Image(systemName:"wallet.pass")
                 }.tag(5)
           
                    
                }
        }
    }

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


