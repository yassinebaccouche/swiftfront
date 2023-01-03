import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView {
                
              
                ProfileView()
                    .badge(2)
                    .tabItem {
                        Label("Received", systemImage: "tray.and.arrow.down.fill").foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
                    }
                
                EditProfileView()
                    .badge("!")
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
               
                
            }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1)))
        }.background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1))) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
