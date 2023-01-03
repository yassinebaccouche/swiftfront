//
//  SideMenuViewModel.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import Foundation
enum SideMenuViewModel : Int, CaseIterable{
    case profile
    case lists
    case bookmarks
    case wallet
    case logout
  
    var description :String{
        switch self{
        case.profile : return "profile"
        case .lists :  return "lists"
        case .bookmarks :return "bookmarks"
        case .wallet :return "wallet"
        case .logout :return "logout"
        
        }
    }
    var imageName:String{
        switch self {
        case.profile : return "person"
        case .lists :  return "list.bullet"
        case .bookmarks :return "bookmark"
        case .wallet :return "wallet.pass"
        case .logout :return "arrow.left.square"
        
        }
    }
}

