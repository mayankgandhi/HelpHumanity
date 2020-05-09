//
//  MapView.swift
//  HelpHumanity
//
//  Created by Mayank on 04/05/20.
//  Copyright © 2020 Mayank. All rights reserved.
//
import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @State var latitudeCoord:Double
    @State var longitudeCoord:Double
    @State var title:String
    
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }


    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: latitudeCoord, longitude: longitudeCoord)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitudeCoord, longitude: longitudeCoord)
        uiView.addAnnotation(annotation)
        
        uiView.setRegion(region, animated: true)
        
        
    }
}


//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
