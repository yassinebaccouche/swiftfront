//
//  SearchBar.swift
//  final
//
//  Created by baccoucheyessin on 5/12/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search...",text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .padding(6)
                .overlay(
                    HStack{
                        Image(systemName:"magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                    }
                )
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
