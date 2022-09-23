import SwiftUI

// #docregion ListWithPersons
struct Person: Identifiable {
  var name: String
  let id = UUID()
}

struct ListWithPersons: View {
  let persons: [Person]
  var body: some View {
    List {
      ForEach(persons) { person in
        Text(person.name)
      }
    }
  }
}

var persons = [
  Person(name: "Person 1"),
  Person(name: "Person 2"),
  Person(name: "Person 3"),
]

struct ListWithPersons_Previews: PreviewProvider {
  static var previews: some View {
    ListWithPersons(persons: persons)
  }
}
// #enddocregion ListWithPersons
