import SwiftUI

// #docregion DarkModeExample
@main
struct darktheme_in_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}
// #enddocregion DarkModeExample
