import SwiftUI

// #docregion ListWithStrings
struct ListWithStrings: View {
  let names = [
    "Person 1",
    "Person 2",
    "Person 3",
  ]
  var body: some View {
    List(names, id: \.self) { name in
      Text(name)
    }
  }
}
// #enddocregion ListWithStrings

struct ListWithStrings_Previews: PreviewProvider {
  static var previews: some View {
    ListWithStrings()
  }
}
