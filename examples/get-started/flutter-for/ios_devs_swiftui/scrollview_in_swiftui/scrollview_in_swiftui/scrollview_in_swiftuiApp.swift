//
//  scrollview_in_swiftuiApp.swift
//  scrollview_in_swiftui
//
//  Created by Vandad Nahavandipoor on 2022-09-25.
//

import SwiftUI

@main
struct scrollview_in_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ExampleScrollView(persons: Person.mockPersons())
    }
  }
}
