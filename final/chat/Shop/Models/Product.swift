//
//  Product.swift
//  final
//
//  Created by baccoucheyessin on 11/12/2022.
//


import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Rich Dad Poor Dad", image: "product1", price: 54),
                   Product(name: "Red wine product", image: "product2", price: 89),
                   Product(name: "Sand product", image: "product3", price: 79),
                   Product(name: "Sea product", image: "product4", price: 94),
                   Product(name: "Cream product", image: "product5", price: 99),
                   Product(name: "Beige product", image: "product6", price: 65),
                   Product(name: "Grey product", image: "product7", price: 54),
                   Product(name: "Mink product", image: "product8", price: 83)]
