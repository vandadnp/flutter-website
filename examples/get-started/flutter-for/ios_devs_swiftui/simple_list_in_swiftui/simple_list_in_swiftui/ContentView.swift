import SwiftUI

// #docregion SimpleList
struct ContentView: View {
  var body: some View {
    List {
      Text("Person 1")
      Text("Person 2")
      Text("Person 3")
    }
  }
}
// #enddocregion SimpleList

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
