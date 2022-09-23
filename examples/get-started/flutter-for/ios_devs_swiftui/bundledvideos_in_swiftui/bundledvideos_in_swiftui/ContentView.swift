import SwiftUI
// #docregion BundledVideosExample
import AVKit

struct ContentView: View {
  var body: some View {
    if let url = Bundle.main.url(
      forResource: "movie",
      withExtension: "mov"
    ) {
      VideoPlayer(
        player: AVPlayer(
          url: url
        )
      )
    } else {
      Text("Could not find movie.mov file in app bundle")
    }
  }
}
// #enddocregion BundledVideosExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
