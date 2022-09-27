import SwiftUI

// represent each person as a Person instance
struct Person: Identifiable, Hashable {
  let id = UUID()
  var name: String
  var age: Int
}

// render all persons on the screen and allow
// the user to tap on each user to see their details
struct ContentView: View {
  let persons: [Person]
  @State private var path: [Person] = []
  var body: some View {
    NavigationStack(path: $path) {
      List {
        ForEach(persons) { person in
          NavigationLink(
            person.name,
            value: person
          )
        }
      }
      .navigationDestination(for: Person.self) { person in
        PersonView(person: person)
      }
    }
  }
}

// #docregion PopBackExample
struct PersonView: View {
  // first define your environment value
  @Environment(\.dismiss) private var dismiss
  let person: Person
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("Name:")
        Text(person.name)
      }
      HStack {
        Text("Age:")
        Text("\(person.age)")
      }
      Divider()
      // and then call it as a function in order
      // to perform the dismissal
      Button("Pop back") {
        dismiss()
      }
    }
  }
}
// #enddocregion PopBackExample

// create 100 mocked Person objects
extension Person {
  static func mockPersons() -> [Person] {
    (0..<100).map { (count: Int) -> Person in
      Person(
        name: "Person #\(count + 1)",
        age: 10 + count
      )
    }
  }
}

// prepare for the preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      persons: Person.mockPersons()
    )
    .preferredColorScheme(.dark)
  }
}
