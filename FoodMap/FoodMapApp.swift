import SwiftUI
import GoogleMaps

@main
struct FoodMapApp: App {
    init() {
        guard let info = Bundle.main.infoDictionary,
              let apiKey = info["GOOGLE_MAP_API_KEY"] as? String else {
            fatalError("GOOGLE_MAP_API_KEY not set in Info.plist")
        }
        GMSServices.provideAPIKey(apiKey)
    }

    var body: some Scene {
        WindowGroup {
            MapView()
        }
    }
}
