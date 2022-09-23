import SwiftUI
import CoreMotion

// #docregion OpenAppExample
struct ContentView: View {
  @Environment(\.openURL) private var openUrl
  var body: some View {
    Button("Open website") {
      openUrl(
        URL(
          string: "https://google.com"
        )!
      )
    }
  }
}
// #enddocregion OpenAppExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
