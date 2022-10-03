import SwiftUI

// #docregion GetUserLocationExample
import CoreLocation
import CoreLocationUI

struct ContentView: View {
  @StateObject var manager = Manager()
  var body: some View {
    VStack {
      if let location = manager.location {
        Text("Your location is \(location.description)")
      }
      LocationButton {
        self.manager.askForLocation()
      }
    }
  }
}
// #enddocregion GetUserLocationExample

// #docregion LocationManagerExample
class Manager: NSObject, ObservableObject, CLLocationManagerDelegate {
  let manager = CLLocationManager()
  
  @Published var location: CLLocationCoordinate2D?
  
  override init() {
    super.init()
    self.manager.delegate = self
  }
  
  func askForLocation() {
    self.manager.requestLocation()
  }
  
  func locationManager(
    _ manager: CLLocationManager,
    didUpdateLocations locations: [CLLocation]
  ) {
    self.location = locations
      .first?
      .coordinate
  }
  
}
extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "Latitude: \(self.latitude), Longitude: \(self.longitude)"
  }
}
// #enddocregion LocationManagerExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
