import SwiftUI

// #docregion GridExample
struct GridView: View {
  var body: some View {
    Grid {
      GridRow {
        Text("Row 1")
        Image(systemName: "square.and.arrow.down")
        Image(systemName: "square.and.arrow.up")
      }
      GridRow {
        Text("Row 2")
        Image(systemName: "square.and.arrow.down")
        Image(systemName: "square.and.arrow.up")
      }
    }
  }
}
// #enddocregion GridExample

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    GridView()
      .preferredColorScheme(.dark)
  }
}
