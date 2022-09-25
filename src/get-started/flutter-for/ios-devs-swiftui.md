<!-- Notes for editors:

* I have done the code regions for code-excerpts but I am not sure how to link to files in specific folders so I've commented out those parts of the document for you to help with, please. I've added the correct paths, you just need to update the path so it works with the Flutter website. Thank you. -->

# Flutter for SwiftUI Developers

This document is for iOS developers who are comfortable developing their apps using SwiftUI. We have a separate document for UIKit which you're welcome to check out if you're more comfortable with UIKit.

Flutter is Google's modern UI framework; a declarative way of writing applications that run on multiple platforms, including iOS and Android. In this document, we will go through the similarities and differences between Flutter and SwiftUI and hopefully, by the end of it all, you will become more confident in your Flutter skills as a native iOS developer who uses SwiftUI.

- [Flutter for SwiftUI Developers](#flutter-for-swiftui-developers)
  - [How do I display static text?](#how-do-i-display-static-text)
  - [How do I add buttons?](#how-do-i-add-buttons)
  - [How do I align components horizontally?](#how-do-i-align-components-horizontally)
  - [How do I align components vertically?](#how-do-i-align-components-vertically)
  - [How do I display a list view?](#how-do-i-display-a-list-view)
  - [How do I display a grid?](#how-do-i-display-a-grid)
  - [How do I create a scroll view?](#how-do-i-create-a-scroll-view)

## How do I display static text?

In SwiftUI, we work with views and each view can have a series of subviews, that you declaratively specify in your Swift code. The example below will display a simple `"Hello, World!"` message to the center of the screen:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/rendering_text_swiftui/rendering_text_swiftui/ContentView.swift (SimpleText)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Text("Hello, World!")
  }
}
```

Unsurprisingly, Flutter offers the ability to display static text on the screen using its `Text` widget. We will talk more and more about widgets as we go on but for now, it's enough to know that a widget is very similar to a SwiftUI view. Let's see the same example, but in Flutter:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/rendering_text_flutter/lib/main.dart (SimpleText)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, World!',
        ),
      ),
    );
  }
}
```

One thing that you need to notice here is the use of the `Center` widget. In SwiftUI, a view's contents are by default rendered in its center but in Flutter this is not the case in all widgets. In this case, our `HomePage` widget's main UI component is `Scaffold` and this widget has chosen to not render its `body` widget at the center of the screen, so if you want to center your text, you have to wrap it with a `Center` widget. We will soon talk more about nested widgets.

## How do I add buttons?

In SwiftUI, you would create a button using the `Button` class as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/rendering_button_swiftui/rendering_button_swiftui/ContentView.swift (SimpleButton)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Button("Do something") {
      // this closure gets called when your
      // button is tapped
    }
  }
}
```

The `Button` class in SwiftUI is constructed using an initializer, and various parameters that the initializer might require. In this case, we are using the initializer that takes in a `titleKey` parameter of type `LocalizedStringKey` and an action of type `@escaping () -> Void`.

In Flutter, to achieve the same results, you *can* use the `TextButton` class as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/rendering_button_flutter/lib/main.dart (SimpleButton)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // this closure gets called when your button is tapped
            // or
            // clicked
          },
          child: const Text('Do something'),
        ),
      ),
    );
  }
}
```

One big difference here beteween native iOS development with SwiftUI and Flutter is that in SwiftUI, if you want a button, then you need to use the `Button` class. But Flutter, being a multi-platform app development framework, you have access to variety of buttons that have pre-defined styles. The `TextButton` class comes from the *Material* package. A package is a set of source code files that are, well, packaged together. We will talk more about packages and Material soon but for now, if you're curious, you can read more about various widgets in the Material package by following [this link](https://docs.flutter.dev/development/ui/widgets/material).

## How do I align components horizontally?

In SwiftUI, stack views play a big part in designing your layouts. That's why there are two separate classes that allow you to create stacks:

1. `HStack` for horizontal stack views
2. `VStack` for vertical stack views

This is a simple SwiftUI code that adds a globe image and a text to a horizontal stack view:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/hstack_in_swiftui/hstack_in_swiftui/ContentView.swift (SimpleHStack)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    HStack {
      Image(systemName: "globe")
      Text("Hello, world!")
    }
  }
}
```

The equivalent of `HStack` in Flutter is `Row`. A row is a UI component who, as its name implies, lays out its *children* horizontally, in a row! Let's write the same code now in Flutter:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/hstack_in_flutter/lib/main.dart (SimpleRow)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Icon(Icons.credit_card),
          Text('Hello, world!'),
        ],
      ),
    );
  }
}
```

The initialization of `HStack` on SwiftUI starts with a curly brackets pair to create a closure as the view builder but we're still calling the initializer of HStack with predefined `alignment` and `spacing`, so the only thing left for us to do is to pass a pair of curly brackets as the view builder. In Flutter, the parameter that expects the children is called `children` and expects a `List<Widget>`. A `List` in Dart is the equivalent of `Array` in Swift.

## How do I align components vertically?

`HStack` and `Row` are used in SwiftUI and Flutter respectively in order to arrange UI components horizontally. Similarly, you can use the `VStack` and, you guessed it, `Column`, in order to arrange your components vertically in SwiftUI and Flutter.

Let's see how you would go about doing the same example as before, but this time arranging the components vertically:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/vstack_in_swiftui/vstack_in_swiftui/ContentView.swift (SimpleVStack)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
      Text("Hello, world!")
    }
  }
}
```

The only thing that changed really between this example and the previous was that `HStack` became `VStack`. The same holds true in Flutter, all your Dart code stays the same, except for changing `Row` to `Column`, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/vstack_in_flutter/lib/main.dart (SimpleColumn)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Icon(Icons.credit_card),
          Text('Hello, world!'),
        ],
      ),
    );
  }
}
```

## How do I display a list view?

In SwiftUI, the base component for displaying lists is `List`. Let's have a look at an example where we display 3 simple `Text` components as list-items inside our `List`:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/simple_list_in_swiftui/simple_list_in_swiftui/ContentView.swift (SimpleList)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    List {
      Text("Person 1")
      Text("Person 2")
      Text("Person 3")
    }
  }
}
```

The initializer of the `List` class in SwiftUI, like many other views that can have sub-views, has a view builder marked as `@ViewBuilder` which allows you to return a series of sub-views to be displayed as the content of that view, in this case, as contents of our list. This is more a convenience than it is the right way of creating lists in SwiftUI as the views that you insert for the contents of a `List` in SwiftUI cannot be more than 10 at a time. If you want to display more than 10 items at a time in a `List` in SwiftUI, you will most probably want to use the `ForEach` syntax or if your items are pure `String` instances, which ours are, you can get away by simply passing the strings to your `List` as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/simple_list_in_swiftui/simple_list_in_swiftui/ListWithStrings.swift (ListWithStrings)"?> -->
```swift
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
```

More often than not though, you will have a list of model objects you want to display to the user. In those cases, you will need to ensure that your model objects are identifiable using the `Identifiable` protocol as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/simple_list_in_swiftui/simple_list_in_swiftui/ListWithPersons.swift (ListWithPersons)"?> -->
```swift
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
```

The way this example works is very similar to how Flutter prefers to build its list views although Flutter doesn't need the list items to be identifiable, unlike SwiftUI. All you have to do is to tell Flutter how many items you want to display and then build a `Widget` per item. Let's see how this looks like in Flutter using the `ListView` widget:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/simple_list_in_flutter/lib/main.dart (SimpleList)"?> -->
```dart
const items = [
  'Person 1',
  'Person 2',
  'Person 3',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
```

Here are a few things to note about this example in Flutter:

* The `ListView` widget has a builder method, much like SwiftUI's `List` class has a view builder that is a closure.
* The `itemCount` parameter of the `ListView` in Flutter dictates how many items need to be displayed and rendered by the `ListView`.
* The `itemBuilder` then gets called with an index from and including 0 up to and excluding the item count, and must return a `Widget` instance per item.

In this example we are returning a `ListTile` per item but you could directly return a `Text` per item as well. The `ListTile` widget has some intrinsic properties such as a specific height and font size that might be quite helpful in building a good-looking list view but you're more than welcome to return almost any other widget that represents your data, per index.

## How do I display a grid?

In SwiftUI, when constructing non-conditional grids, you would use `Grid` and `GridRow`. Each `GridRow` represents a list of views to be displayed in that row and the `Grid` renders all the rows together. Here is an example of how this can be done in SwiftUI:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/grid_in_swiftui/grid_in_swiftui/ContentView.swift (GridExample)"?> -->
```swift
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
```

In order to display grids in Flutter, you would use the `GridView` widget. This widget has various constructors each of which achieves more or less the same goal but with different input parameters. In this example, to comply with the SwiftUI code as much as possible, we will use the `.builder()` initializer of our `GridView` widget in Flutter like so:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/grid_in_flutter/lib/main.dart (GridExample)"?> -->
```dart
const widgets = [
  Text('Row 1'),
  Icon(Icons.download),
  Icon(Icons.upload),
  Text('Row 2'),
  Icon(Icons.download),
  Icon(Icons.upload),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 40.0,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
      ),
    );
  }
}
```

The delegate of type `SliverGridDelegateWithFixedCrossAxisCount` determines various parameters using which the grid view will lay out its components such as `crossAxisCount` which is the number of items to display per row horizontally, and `mainAxisExtent` that dictates the number of pixels each row has to have.

One important distinction between how SwiftUI's `Grid` and Flutter's `GridView` work is that in SwiftUI, you create your top-level `Grid` component and feed it with instances of `GridRow` but in Flutter, you create your `GridView` and then using the delegate you decide how the grid should lay out its components.

The term *axis* is something that you'll come across more and more on your journey to learn Flutter so let's talk about it quickly: in a widget those main task is to lay out its components vertically, the main axis is `Axis.vertical` and the cross axis is `Axis.horizontal` so in case of our `GridView`, the main axis is vertical because that's what grids do, they lay out their rows vertically and the cross axis would be horizontal.

## How do I create a scroll view?

In SwiftUI, if you want to create custom scrolling components, you would use the `ScrollView` class. Let's say that you want to display a series of `User` class instances on the screen in a vertically scrollable fashion. Your SwiftUI implementation might look similar to this:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/scrollview_in_swiftui/scrollview_in_swiftui/ContentView.swift (ScrollViewExample)"?> -->
```swift
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
```

In this example we have done things more like you would do it in a production-level application in that:

1. we have a `Person` class that represents the data each person would carry, such as name and age.
2. The `Person` class conforms to the `Identifiable` protocol so that it can be used inside the `ForEach` view with ease.
3. Each person is then rendered using a dedicated `PersonView` view class for the sake of reusability.

The closest equivalent of `ScrollView` in Flutter is `SingleChildScrollView`. We can use it to implement the same code as we just did in SwiftUI, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/scrollview_in_flutter/lib/main.dart (ScrollExample)"?> -->
```dart
// create a class that holds each person's data
@immutable
class Person {
  final String name;
  final int age;
  const Person({
    required this.name,
    required this.age,
  });
}

// like in SwiftUI, we create a widget (view in SwiftUI),
// that represents each person visually on the screen
class PersonView extends StatelessWidget {
  final Person person;
  const PersonView({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Name:'),
            Text(person.name),
          ],
        ),
        Row(
          children: [
            const Text('Age:'),
            Text(person.age.toString()),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

// then we create a list of people
final mockPersons = Iterable.generate(
  100,
  (index) => Person(
    name: 'Person #${index + 1}',
    age: 10 + index,
  ),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // and last but not least, we display the list
      // of people on the screen inside a scroll viwe of type
      // SingleChildScrollView (equivalent of ScrollView in SwiftUI)
      body: SingleChildScrollView(
        child: Column(
          children: mockPersons
              .map(
                (person) => PersonView(
                  person: person,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
```