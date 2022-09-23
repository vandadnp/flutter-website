import SwiftUI

// #docregion NetworkImageExample
let url = URL(
  string: "https://images.unsplash.com/photo-1521790797524-b2497295b8a0"
)

struct ContentView: View {
  var body: some View {
    AsyncImage(url: url) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
    } placeholder: {
      ProgressView()
    }
    .frame(
      maxWidth: 300,
      maxHeight: 300
    )
  }
}
// #enddocregion NetworkImageExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
