//
//  Posts.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//

struct Posts {
    
    var idUser: String
    var Title : String
    var userName:String
    var userImage :String
    var usercalls :Int
  
  
  
    init(Title: String,idUser: String,userName:String,userImage:String,usercalls:Int) {
        
        self.Title = Title
        self.idUser = idUser
        self.userName=userName
        self.userImage = userImage
        self.usercalls = usercalls
        
   
    }
    init(  Title: String) {
        self.Title = Title
        self.userName=""
        self.idUser = ""
        self.userImage = ""
        self.usercalls = 1000
    }
    
}

