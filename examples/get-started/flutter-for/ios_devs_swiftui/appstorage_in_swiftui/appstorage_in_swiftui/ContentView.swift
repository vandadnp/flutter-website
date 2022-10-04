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
    
    let usernameBinding = Binding<String>(
      get: {
        return self.username
      },
      set: { text in
        self.username = text
      }
    )
    
    VStack {
      TextField(
        "Enter your username here",
        text: usernameBinding
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
