//
//  Comment.swift
//  final
//
//  Created by baccoucheyessin on 14/12/2022.
//

struct Comments {
    
    var idUser: String
    
    var userName:String
    var userImage :String
   
    var com : String
  
    var id: String!
  
  
    init(com: String,idUser: String,userName:String,userImage:String) {
        
        self.com = com
        self.idUser = idUser
        self.userName=userName
        self.userImage = userImage
    
        
   
    }
    
    init(  com: String) {
        self.com = com
        self.userName=""
        self.idUser = ""
        self.userImage = ""
       
    }
    
}
