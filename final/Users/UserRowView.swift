//
//  UserRowView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI

struct UserRowView: View {
    var user : User
    
    var body: some View {
        
        
            VStack{
                HStack{
                    NavigationLink(destination: ProfileUserView(user: user), label:{
                        AsyncImage(url: URL(string: "http://localhost:5001/img/"+user.image),  content:{ image in
                            image  .resizable()
                                .frame(width: 50,height: 50)
                                .clipShape(Circle())
                        },placeholder: { })
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.firstName)
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                            Text(user.lastName)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            
                        }
                    })
                    Spacer()
                }.padding()
            }
        
    }}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User(id: "", firstname: "", lastName: "", image: "",calls: 0))
    }
}
