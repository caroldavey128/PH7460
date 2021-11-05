//
//  MapView.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-06-30.
//

import SwiftUI
import MapKit

struct MapViewUIKit: UIViewRepresentable {
    let region: MKCoordinateRegion
    let mapType: MKMapType
    var coordinate: CLLocationCoordinate2D
    let locations: MainContents
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        //display a Map Pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = locations.contentName.uppercased()
        mapView.addAnnotation(annotation)
        mapView.mapType = mapType
        return mapView
    }
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
       
        
    }
}

struct MapView: View {
    @State var region = MKCoordinateRegion()
    @State private var mapType: MKMapType = .standard
    @State var coordinate: CLLocationCoordinate2D
    @State var locations: MainContents

    
    var body: some View {
        
        ZStack {
            MapViewUIKit(region: region, mapType: mapType, coordinate: coordinate, locations: locations).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            
            VStack {
                Spacer()
                Picker("", selection: $mapType) {
                    Text("Standard")
                        .foregroundColor(.red)
                        .fontWeight(.heavy)
                        .tag(MKMapType.standard)
                    Text("Satellite")
                        .foregroundColor(.red)
                        .fontWeight(.heavy)
                        .tag(MKMapType.satellite)
                    Text("Hybrid")
                        .foregroundColor(.red)
                        .fontWeight(.heavy)
                        .tag(MKMapType.hybrid)
                }
                .pickerStyle(WheelPickerStyle())
                .offset(y: 50)
                .font(.largeTitle)
            }
        }
            
            
    
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView( coordinate: CLLocationCoordinate2D(), locations: MainContents(contentid: 00, contentName: "name", contentDescription: "description", contentImage: "image", contentTitle: "title", contentLatitude: 0.0, contentLongitude: 0.0, contentLocations: Locations(id: 0, title: "title", name: "name", description: "description", image: "image", latitude: 0.0, longitude: 0.0, isFavorite: true)))
    }
}
