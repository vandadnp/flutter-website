import SwiftUI
import CoreMotion

// #docregion AccelerometerExample
struct ContentView: View {
  @ObservedObject private var manager = AccelerometerManager()
  var body: some View {
    Text(manager.data.description)
  }
}
// #enddocregion AccelerometerExample

// #docregion AccelerometerManagerExample
class AccelerometerManager: ObservableObject {
  
  @Published var data: CMAcceleration = .init(
    x: 0.0,
    y: 0.0,
    z: 0.0
  )
  
  private var manager: CMMotionManager
  
  init() {
    self.manager = CMMotionManager()
    self.manager.accelerometerUpdateInterval = 1.0 / 60.0
    self.manager.startAccelerometerUpdates(to: .main) { data, error in
      guard error == nil else {
        return
      }
      if let data {
        self.data = data.acceleration
      }
    }
  }
}

extension CMAcceleration: CustomStringConvertible {
  public var description: String {
    "x: \(x), y: \(y), z: \(z)"
  }
}
// #enddocregion AccelerometerManagerExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
