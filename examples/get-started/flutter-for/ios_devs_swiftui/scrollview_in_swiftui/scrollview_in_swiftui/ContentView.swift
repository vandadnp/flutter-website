import SwiftUI

// #docregion ScrollViewExample
// represent each person as a Person instance
struct Person: Identifiable {
  let id = UUID()
  var name: String
  var age: Int
}

// render all persons on the screen
struct ExampleScrollView: View {
  let persons: [Person]
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(persons) { person in
          PersonView(person: person)
      }
    }
  }
}

// each Person is rendered using this view
struct PersonView: View {
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
    }
  }
  }
}

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
struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleScrollView(
      persons: Person.mockPersons()
    )
      .preferredColorScheme(.dark)
  }
}
// #enddocregion ScrollViewExample
