//
//  StocksApp.swift
//  final
//
//  Created by baccoucheyessin on 3/1/2023.
//

import SwiftUI

struct StocksApp: View {
    @StateObject var appVM = AppViewModel()
    
    var body: some View {
        
            NavigationStack {
                MainListView()
            }
            .environmentObject(appVM)
        
    }
}


