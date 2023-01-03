//
//  ShopView.swift
//  final
//
//  Created by baccoucheyessin on 11/12/2022.
//

import SwiftUI

struct ShopView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Books&Calls Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                    
                } label: {
                    CartButton(numberOfProducts:
                                cartManager.products.count)
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
