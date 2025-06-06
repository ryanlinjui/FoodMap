import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: 23.9037, longitude: 121.0794, zoom: 12)
        let options = GMSMapViewOptions()
        options.camera = camera

        let mapView = GMSMapView(options: options)
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true

        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {}
}

struct MapView: View {
    var body: some View {
        GoogleMapView()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
    }
}
