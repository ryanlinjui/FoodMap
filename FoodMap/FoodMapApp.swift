import SwiftUI
import GoogleMaps

@main
struct FoodMapApp: App {
    init() {
        guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else {
          fatalError("Info.plist not found")
        }
        guard let apiKey: String = infoDictionary["GOOGLE_MAP_API_KEY"] as? String else {
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