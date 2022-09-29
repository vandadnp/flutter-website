//
//  ContentView.swift
//  darktheme_in_swiftui
//
//  Created by Vandad Nahavandipoor on 2022-09-29.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello world")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
