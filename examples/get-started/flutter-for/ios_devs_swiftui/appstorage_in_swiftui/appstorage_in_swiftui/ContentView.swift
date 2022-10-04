//
//  ContentView.swift
//  photopicker_in_swiftui
//
//  Created by Vandad Nahavandipoor on 2022-10-03.
//

import SwiftUI

// #docregion AppStorageExample
struct ContentView: View {
  @AppStorage("username") private var username: String = ""
  var body: some View {
    VStack {
      TextField(
        "Enter your username here",
        text: $username
      )
    }
  }
}
// #enddocregion AppStorageExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
