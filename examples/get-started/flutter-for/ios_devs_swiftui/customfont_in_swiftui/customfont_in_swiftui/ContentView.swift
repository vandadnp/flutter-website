import SwiftUI

// #docregion CustomFontExample
struct ContentView: View {
  var body: some View {
    Text("Hello")
      .font(
        Font.custom(
          "BungeeSpice-Regular",
          size: 40
        )
      )
  }
}
// #docregion CustomFontExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
