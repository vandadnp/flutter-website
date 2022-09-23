import SwiftUI

// #docregion SimpleButton
struct ContentView: View {
  var body: some View {
    Button("Do something") {
      // this closure gets called when your
      // button is tapped
    }
  }
}
// #enddocregion SimpleButton

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
