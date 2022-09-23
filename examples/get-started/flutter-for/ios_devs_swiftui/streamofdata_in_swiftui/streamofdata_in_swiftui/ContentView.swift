// #docregion TimerExample
import SwiftUI
import Combine

struct ContentView: View {
  @State private var date = Date.now
  
  private let timer = Timer.publish(
    every: 1.0,
    on: .main,
    in: .common
  ).autoconnect()
  
  var body: some View {
    Text(date.description)
      .onReceive(timer) { date in
        self.date = date
      }
  }
}
// #enddocregion TimerExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
