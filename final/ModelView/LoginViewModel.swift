import Foundation
import Alamofire
import UIKit
import SwiftyJSON
import AlamofireImage
import SDWebImageSwiftUI

class LoginViewModel: ObservableObject {
    var calls : Int = 1000
     var firstName : String = ""
    var lastName : String  = ""
    var password : String  = ""
    var email : String  = ""
    var resetCode : String = ""
    var validateCode : String = ""
    var newPassword : String = ""
    var confirmpass : String = ""
    var image: String = ""
    var errorTitleFaceIDPopUp = "Error"
    var errorMessageFaceIDPopUp = "Face ID/Touch ID may not be configured"
    var errorOkActionFaceIDPopUp = "ok"
    @Published var errorPopUpIsDisplayed = false
    
    @Published   var users : [User] = []
    
    @Published   var posts : [Posts] = []
    @Published   var userPosts : [Posts] = []
    static var currentUser: User?
    
    static let sharedInstance = LoginViewModel()
    
    
   
    init() {
           getAllUsers(complited: {(success , respnse)in
               if success{
                   let users = respnse!
                   print("ahyaaaaa",users)
               }else {
                   print("error cant connect ")
               }
               
           })
       }
    func LogIn(email: String,password: String, complited: @escaping(User?)-> Void )
    
    {
        
        AF.request("http://localhost:5001/user/Signin" , method: .post, parameters: ["email": email,"password": password] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON {
                (response) in
                switch response.result {
                    
                case .success(let JSON):
                    let response = JSON as! NSDictionary
                    let userResponse = response.object(forKey: "user") as! NSDictionary
                    let email = userResponse.object(forKey: "email") as? String ?? ""
                    let lastName = userResponse.object(forKey: "last_name") as? String ?? ""
                    let password = userResponse.object(forKey: "password") as? String ?? ""
                    let firstName = userResponse.object(forKey: "first_name") as? String ?? ""
                    let image = userResponse.object(forKey: "image") as? String ?? ""
                    let calls = userResponse.object(forKey: "calls")as? Int
                    let id = userResponse.object(forKey: "_id")  as? String ?? ""
                   
                    print("success  \(email )")
                    print("success  \(lastName )")
                    print("success  \(password )")
                    print("success  \(image )")
                  
                    var currentUser = User(firstname: firstName, password: password, email: email, lastName: lastName, image: image,calls: calls ?? 0)
                    currentUser.id = id
                    currentUser.image = image
                    Self.currentUser = currentUser
                    UserManager.shared.saveUser(user: currentUser)
                    print("success \(JSON )")
                   
                    complited(currentUser)
                case .failure(let error):
                    print("request failed \(error)")
                    complited(nil)
                }
            }
  
    }
   
    
    func SignUp(user: User) {
        print(user)
        let parametres: [String: Any] = [
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
           
            
        ]
        AF.request("http://localhost:5001/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
    func updateUser(user: User,image: UIImage ) {
        print(user)
        let parametres: [String: Any] = [
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            "image" : user.image
            
        ]
        
      
       
        let imgData = image.jpegData(compressionQuality: 0.2)!

       

        AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
                for ( key,value) in parametres {
                  
                    multipartFormData.append(  (value as! String).data(using: .utf8)!, withName: key)
                    } //Optional for extra parameters
            },
                  to:"http://localhost:5001/user/updateUser/\(user.id ?? "")").responseData(completionHandler: { response in
            switch response.result {
             case .success:

              print("success image")

             case .failure(let encodingError):
                 print(encodingError)
             }
        })
        
        
    
    }
    func LogInGoogle(complited: @escaping(User?)-> Void )
      
      {
          
          AF.request("http://localhost:5001/auth/google" , method: .get ,encoding: JSONEncoding.default)
              .validate(statusCode: 200..<300)
              .validate(contentType: ["application/json"])
              .responseJSON { [self]
                  (response) in
                  switch response.result {
                      
                  case .success(let JSON):
                      let response = JSON as! NSDictionary
                      let userResponse = response.object(forKey: "user") as! NSDictionary
                      let email = userResponse.object(forKey: "email") as? String ?? ""
                      let lastName = userResponse.object(forKey: "given_name") as? String ?? ""
                  
                      let firstName = userResponse.object(forKey: "family_name") as? String ?? ""
                      let image = userResponse.object(forKey: "picture") as? String ?? ""
                
                      print("success  \(email )")
                      print("success  \(lastName )")
                     
                      print("success  \(image )")
                    
                      var currentUser = User(firstname: firstName, lastName: lastName, email: email, image: image,calls: calls)
                      currentUser.firstName = firstName
                      currentUser.lastName = lastName
                      currentUser.image = image
                      currentUser.calls = calls
                      Self.currentUser = currentUser
                    
                      print("success \(JSON )")
                     
                      complited(currentUser)
                  case .failure(let error):
                      print("request failed \(error)")
                      complited(nil)
                  }
              }
    
      }
    
    func ResetPassword(email: String) {
            let parametres: [String: Any] = [
                "email": email
            ]
            AF.request("http://localhost:5001/user/resetpwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        print("email : ",email)
                    case .failure(let error):
                        print("request failed \(error)")
                    }
                }
            

        }
    
    func ValideCode(code :String,complited: @escaping(Bool)-> Void ) {
            let parametres: [String: Any] = [
                "code": code
            ]
            AF.request("http://localhost:5001/user/resetpassword" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        
                        complited(true)
                    case .failure(let error):
                        print("request failed \(error)")
                        complited(false)
                    }
                }
            

        }
    
    func changePassword(email:String,newPassword: String) {
            let parametres: [String: Any] = [
                "email": email,
                "password": newPassword
            ]
            AF.request("http://localhost:5001/user/changepwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        print("email : ",email)
                        
                    case .failure(let error):
                        print("request failed \(error)")
                        
                    }
                }
            

        }
    func getAllUsers(complited: @escaping(Bool, [User]?) -> Void) {
      
        
        AF.request("http://localhost:5001/user/alluser" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
             
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.users.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    print(self.users)
                    
                    
                    complited(true,self.users)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
   
    func makeItem(jsonItem : JSON) -> User {
        return User (id: jsonItem["_id"].stringValue,
                     firstname: jsonItem["first_name"].stringValue,
                     lastName:jsonItem["last_name"].stringValue,
                     image:    jsonItem["image"].stringValue,
                     calls: jsonItem["calls"].intValue)

    }
    
    func makeItem(jsonItem : JSON) -> Posts {
        return Posts(Title: jsonItem["Title"].stringValue,idUser: jsonItem["idUser"].stringValue,userName:jsonItem ["userName"].stringValue,userImage:jsonItem ["userImage"].stringValue,usercalls:jsonItem["usercalls"].intValue)

    }
    
    private let biometricIDAuth = BiometricIDAuth()
    
    func faceIDLogin(completionSuccess: @escaping () -> Void, completionError: @escaping () -> Void) {
        biometricIDAuth.canEvaluate { (canEvaluate, _, _) in
            guard canEvaluate else {
                errorPopUpIsDisplayed = true
                completionError()
                return
            }
            
            biometricIDAuth.evaluate { [weak self] (success, error) in
                guard success else {
                    self?.errorPopUpIsDisplayed = true
                    completionError()
                    return
                }
                self?.errorPopUpIsDisplayed = false
                completionSuccess()
            }
        }
    }
    

   
    
    
}
