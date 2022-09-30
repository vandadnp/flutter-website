import SwiftUI

// #docregion CustomImagesExample
struct ContentView: View {
  var body: some View {
    Image("Blueberries")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(
        maxWidth: 200,
        maxHeight: 200
      )
  }
}
// #docregion CustomImagesExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
