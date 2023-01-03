//
//  FeedView.swift
//  final
//
//  Created by baccoucheyessin on 29/11/2022.
//

import SwiftUI
import MapKit

struct NotificationsView: View {
   @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var location = [Location]()
    var body: some View {
       
        ZStack{
            Map(coordinateRegion: $mapRegion, annotationItems:location){
                location in  MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
            
                .ignoresSafeArea()
          
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32,height: 32)
            VStack{
                Spacer()
                HStack{
                    
                    Spacer()
                    Button{
                        let newLocation = Location(id: UUID(), name:"New Location", description: "" , latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude )
                        location.append(newLocation)
                    }
                label: {
                    Image(systemName: "plus")
                        
                }.padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
