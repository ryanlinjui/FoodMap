import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    @Binding var shouldCenterOnLocation: Bool
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: 23.9037, longitude: 121.0794, zoom: 10)
        let options = GMSMapViewOptions()
        options.camera = camera

        let mapView = GMSMapView(options: options)
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = false

        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        if shouldCenterOnLocation {
            if let location = uiView.myLocation {
                let camera = GMSCameraPosition(target: location.coordinate, zoom: 16)
                uiView.animate(to: camera)
            }
            DispatchQueue.main.async {
                shouldCenterOnLocation = false
            }
        }
    }
}

struct MapView: View {
    @State private var shouldCenterOnLocation = false
    
    var body: some View {
        ZStack {
            GoogleMapView(shouldCenterOnLocation: $shouldCenterOnLocation)
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        shouldCenterOnLocation = true
                    }) {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 100)
                }
            }
        }
    }
}