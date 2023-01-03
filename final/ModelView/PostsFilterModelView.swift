//
//  PostsFilter.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import Foundation
enum PostsFilterModelView: Int, CaseIterable{
    case posts
    case replie
    case likes
    

var title: String{
    switch self {
    case .posts : return "Posts"
    case .replie: return "replies"
    case .likes: return "likes"
        
    }
}
}
