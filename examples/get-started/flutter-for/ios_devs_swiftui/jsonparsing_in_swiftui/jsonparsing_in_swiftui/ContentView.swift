import SwiftUI

// #docregion JsonExample
struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

struct ContentView: View {
  @State private var posts = [Post]()
  var body: some View {
    List(self.posts, id: \.id) { post in
      VStack(alignment: .leading) {
        Text(post.title)
          .font(.title)
        Text(post.body)
          .font(.body)
      }
    }
    .task {
      await loadData()
    }
  }
  
  private func loadData() async {
    guard let url = URL(
      string: "https://jsonplaceholder.typicode.com/posts"
    ) else {
      return
    }
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      let posts = try decoder.decode([Post].self, from: data)
      self.posts = posts
    } catch {
      // handle this gracefully
    }
  }
}
// #enddocregion JsonExample

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
