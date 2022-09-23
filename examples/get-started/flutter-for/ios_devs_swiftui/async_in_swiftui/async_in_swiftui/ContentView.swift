import SwiftUI

// #docregion WeatherEnum
// a 1 second delay which we will use
// in our mocked-api-call in a moment
extension UInt64 {
  static let oneSecond = UInt64(1_000_000_000)
}

// the enum that represents our weather
enum Weather: String {
  case rainy, cloudy, sunny
}
// #enddocregion WeatherEnum

// #docregion ViewModel
@MainActor class ContentViewModel: ObservableObject {
  @Published private(set) var result: Weather?
  
  func load() async {
    try? await Task.sleep(nanoseconds: .oneSecond)
    self.result = .sunny
  }
  
}
// #enddocregion ViewModel

// #docregion ContentView
struct ContentView: View {
  // define your view model as a state object
  // so you can listen to its published properties
  @StateObject var viewModel = ContentViewModel()
  var body: some View {
    Text(viewModel.result?.rawValue ?? "Loading...")
      .task {
        // await on the "load()" function
        await viewModel.load()
      }
  }
}
// #enddocregion ContentView

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
