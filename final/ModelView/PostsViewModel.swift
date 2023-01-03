//
//  PostsViewModel.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//
import Firebase
import UIKit
import Alamofire
import SwiftyJSON
class PostsViewModel: ObservableObject {
    

 
    @Published   var postes : [Posts] = []
    @Published var poste: [Posts] = []
static var currentPosts: Posts?

    
    init() {
           getallPosts(complited: {(success , respnse)in
               if success{
                   let postes = respnse!
                   print("ahyaaaaa",postes)
               }else {
                   print("error cant connect ")
               }
               
           })
       }
    
    func getallPosts(complited: @escaping(Bool, [Posts]?) -> Void) {
      
        
        AF.request("http://localhost:5001/Post/post" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.postes.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.postes)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    func makeItem(jsonItem : JSON) -> Posts {
        return Posts(Title: jsonItem["Title"].stringValue,idUser: jsonItem["idUser"].stringValue,userName:  jsonItem["userName"].stringValue,userImage:jsonItem["userImage"].stringValue,usercalls:jsonItem["usercalls"].intValue)

    }
    
    func CREATEPOST(post: Posts) {
        print(post)
        let parametres: [String: Any] = [
            "Title": post.Title,
            "id": post.idUser,
            "userName":post.userName,
            "userImage":post.userImage,
            "usercalls": post.usercalls
            
            
            
            
        ]
        AF.request("http://localhost:5001/post/addp" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
    }
    func getPostsbyUsers(id : String, complited: @escaping(Bool, [Posts]?) -> Void) {
      
        
        AF.request("http://localhost:5001/post/getpost/"+id , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
             
                  
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.postes.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                   
                    
                    
                    complited(true,self.postes)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }


                   
        
    }
 
  
}







    
    

   

