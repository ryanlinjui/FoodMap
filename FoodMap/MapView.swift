//
//  MapView.swift
//  FoodMap
//
//  Created by RyanLin on 2025-06-01.
//

import SwiftUI
import GoogleMaps

struct MapView: View {
    var body: some View {
        GoogleMapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct GoogleMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 10.0)
        let mapView = GMSMapView()
        mapView.camera = camera
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Update the map view if needed
    }
}
