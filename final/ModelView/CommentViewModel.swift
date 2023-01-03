//
//  CommentsViewModel.swift
//  final
//
//  Created by baccoucheyessin on 27/11/2022.
//
import Firebase
import UIKit
import Alamofire
import SwiftyJSON
class CommentViewModel: ObservableObject {
    
    var com : String = ""
    
    @Published   var comments : [Comments] = []
    static var currentComments: Comments?
    
    static let sharedInstance = CommentViewModel()
    
    init() {
        getallComments(complited: {(success , respnse)in
            if success{
                let comments = respnse!
                print("ahyaaaaa",comments)
            }else {
                print("error cant connect ")
            }
            
        })
    }
    func CREATECOM(comment: Comments) {
        print(comment)
        let parametres: [String: Any] = [
            "com": comment.com,
            "id": comment.idUser,
            "userName":comment.userName,
            "userImage":comment.userImage
            
            
            
        ]
        AF.request("http://localhost:5001/Commentaire/add" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
    
    func getallComments(complited: @escaping(Bool, [Comments]?) -> Void) {
        
        
        AF.request("http://localhost:5001/Commentaire" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    
                    
                    for singleJsonItem in JSON(response.data!){
                        
                        self.comments.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.comments)
                case let .failure(error):
                    debugPrint(error)
                    complited(false,nil)
                }
            }
        
    }
    
    func makeItem(jsonItem : JSON) -> Comments {
        return Comments( com : jsonItem["com"].stringValue,idUser: jsonItem["idUser"].stringValue,userName:  jsonItem["userName"].stringValue,userImage:jsonItem["userImage"].stringValue)
        
    }}
/*func getbypost(id : String, complited: @escaping(Bool, [Comments]?) -> Void) {
      
        
        AF.request("http://localhost:5001/commentaire/getpost/"+id , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
             
                  
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.comments.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                   
                    
                    
                    complited(true,self.comments)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }*/




               
    








    
    

   

