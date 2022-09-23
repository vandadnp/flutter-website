import SwiftUI

// #docregion HttpPostExample
struct ContentView: View {
  @State private var result: String?
  var body: some View {
    Text(result ?? "Loading...")
    .task {
      self.result = await postData()
    }
  }
  
  private func postData() async -> String? {
    guard let url = URL(
      string: "https://reqbin.com/sample/post/json"
    ) else {
      return nil
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue(
      "application/json",
      forHTTPHeaderField: "Content-Type"
    )
    let object = ["key": "value"]
    do {
      let json = try JSONSerialization.data(withJSONObject: object)
      request.httpBody = json
      let (data, _) = try await URLSession.shared.data(for: request)
      let str = String(data: data, encoding: .utf8)
      return str
    } catch {
      // handle this gracefully
      return nil
    }
  }
}
// #enddocregion HttpPostExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
