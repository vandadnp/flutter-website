import SwiftUI

// #docregion StylingButtonExample
struct ContentView: View {
  var body: some View {
    Button("Do something") {
        // do something when button is tapped
      }
      .padding()
      .font(.system(size: 30, weight: .bold))
      .background(Color.yellow)
      .foregroundColor(Color.blue)
      .cornerRadius(20)
  }
}
// #docregion StylingButtonExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
