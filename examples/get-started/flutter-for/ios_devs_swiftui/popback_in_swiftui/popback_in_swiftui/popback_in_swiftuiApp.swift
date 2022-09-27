import SwiftUI

@main
struct popback_in_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        persons: Person.mockPersons()
      )
    }
  }
}
