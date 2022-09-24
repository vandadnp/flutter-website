import SwiftUI

// #docregion SimpleVStack
struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "creditcard")
      Text("Hello, world!")
    }
  }
}
// #enddocregion SimpleVStack

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
