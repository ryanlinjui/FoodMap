import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    // 預設座標，可視需求修改
    let latitude: CLLocationDegrees = 1.285
    let longitude: CLLocationDegrees = 103.848
    let zoomLevel: Float = 12

    func makeUIView(context: Context) -> GMSMapView {
        // 設定地圖初始鏡頭
        let camera = GMSCameraPosition.camera(
            withLatitude: latitude,
            longitude: longitude,
            zoom: zoomLevel
        )
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        // 若需顯示「我的位置」按鈕，Info.plist 要有 NSLocationWhenInUseUsageDescription
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // SwiftUI 更新時若需要調整地圖，可在此實作
    }
}