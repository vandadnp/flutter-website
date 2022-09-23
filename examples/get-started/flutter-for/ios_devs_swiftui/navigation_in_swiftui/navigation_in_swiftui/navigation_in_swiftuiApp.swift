import SwiftUI

@main
struct navigation_in_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        persons: Person.mockPersons()
      )
    }
  }
}
