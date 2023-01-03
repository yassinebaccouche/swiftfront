//
//  Location.swift
//  final
//
//  Created by baccoucheyessin on 2/1/2023.
//

import Foundation

struct Location: Identifiable, Codable,Equatable{
    let id: UUID
    var name: String
    var description :String
    let latitude: Double
    let longitude : Double
}
