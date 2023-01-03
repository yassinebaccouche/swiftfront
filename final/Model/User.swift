struct User {
    
    
    var firstName : String = ""
    var lastName : String = ""
    var password : String = ""
    var email : String = ""
    var id: String! = ""
    var image : String = ""
    var calls : Int = 1000
    
  
    
    init(firstname: String, password: String, email: String, lastName: String , image:String , calls : Int) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
        self.image = image
        self.calls = calls
       
    }
  
    
    init(firstname: String, password: String, email: String, lastName: String ,calls :Int) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
        self.calls = calls
        
   
        
    }
  
    init(firstname: String ,lastName: String, email: String, image:String ,calls :Int) {
            self.firstName = firstname
            self.lastName = lastName
            self.email = email
            self.image = image
        self.calls = calls
            
        
        }
    init(id: String ,firstname:  String, lastName: String,image:String ,calls:Int ) {
        self.id = id
        self.firstName = firstname
        self.lastName = lastName
        self.image = image
        self.calls = calls
    }
    
    
    
}
