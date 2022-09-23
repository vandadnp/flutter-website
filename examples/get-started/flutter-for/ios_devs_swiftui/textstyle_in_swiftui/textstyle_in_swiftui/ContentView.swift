import SwiftUI

// #docregion StylingTextExample
struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .font(.system(size: 30, weight: .heavy))
      .foregroundColor(.yellow)
  }
}
// #enddocregion StylingTextExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
