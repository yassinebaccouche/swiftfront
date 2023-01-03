//
//  PhotoSelectorView.swift
//  final
//
//  Created by baccoucheyessin on 5/12/2022.
//

import SwiftUI

struct PhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selctedImage : UIImage?
    @State private var profileImage : Image?
    var body: some View {
        VStack{
            
            VStack(alignment: .leading){
                
                HStack{Spacer()}
                Text("Create your account.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                 
                
                Text("Add a profile photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }.frame( height:  260 )
                .padding(.leading)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(RoundedShape(corners: [.bottomRight  ]))
             
            Button {
                showImagePicker.toggle()
            }label: {
                Image("addphoto")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFit()
                    .frame(width: 250,height: 200)
                    .padding(.top,44)
            }
            .sheet(isPresented: $showImagePicker){
                ImagePicker(selectedImage: $selctedImage )
            }
            Spacer()
            NavigationLink(destination: Login().navigationBarBackButtonHidden(true)){
                Text("Add photo later ?")
            }.fontWeight(.regular)
                .foregroundColor(.blue)
                .frame(width: 200,height: 46)
                .padding(.vertical)
                .padding(.all)
                .position(x:180,y:260)
                .padding()
            
        
        }.ignoresSafeArea()

        
    }
    
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectorView()
    }
}
