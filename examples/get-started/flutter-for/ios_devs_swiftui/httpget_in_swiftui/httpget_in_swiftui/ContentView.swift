import SwiftUI

// #docregion HttpGetCallExample
struct ContentView: View {
  // a state variable that keeps track of whether we
  // fetched our data or not
  @State var hasReceivedData = false
  var body: some View {
    Text(hasReceivedData ? "Got data" : "Loading...")
      // upon this text being displayed, attempt to retrieve the data
      // and associated the results with the state variable
      .task {
        self.hasReceivedData = (try? await loadData()) ?? false
      }
  }
  
  // this function will load the data for us
  func loadData() async throws -> Bool {
    guard let url = URL(
      string: "https://jsonplaceholder.typicode.com/posts"
    ) else {
      return false
    }
    let request = URLRequest(url: url)
    let (data, _) = try await URLSession.shared.data(for: request)
    // do something with the data here
    print(data.count)
    return true
  }
}
// #enddocregion HttpGetCallExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
