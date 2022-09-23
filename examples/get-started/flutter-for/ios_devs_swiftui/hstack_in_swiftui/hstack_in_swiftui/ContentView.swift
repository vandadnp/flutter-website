import SwiftUI

// #docregion SimpleHStack
struct ContentView: View {
  var body: some View {
    HStack {
      Image(systemName: "creditcard")
      Text("Hello, world!")
    }
  }
}
// #enddocregion SimpleHStack

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
