<!-- Notes for editors:

* I have done the code regions for code-excerpts but I am not sure how to link to files in specific folders so I've commented out those parts of the document for you to help with, please. I've added the correct paths, you just need to update the path so it works with the Flutter website. Thank you. -->

# Flutter for SwiftUI Developers

This document is for iOS developers who are comfortable developing their apps using SwiftUI. We have a separate document for UIKit which you're welcome to check out if you're more comfortable with UIKit.

Flutter is Google's modern UI framework; a declarative way of writing applications that run on multiple platforms, including iOS and Android. In this document, we will go through the similarities and differences between Flutter and SwiftUI and hopefully, by the end of it all, you will become more confident in your Flutter skills as a native iOS developer who uses SwiftUI.

- [Flutter for SwiftUI Developers](#flutter-for-swiftui-developers)
  - [UI Basics](#ui-basics)
    - [How do I display static text?](#how-do-i-display-static-text)
    - [How do I add buttons?](#how-do-i-add-buttons)
    - [How do I align components horizontally?](#how-do-i-align-components-horizontally)
    - [How do I align components vertically?](#how-do-i-align-components-vertically)
    - [How do I display a list view?](#how-do-i-display-a-list-view)
    - [How do I display a grid?](#how-do-i-display-a-grid)
    - [How do I create a scroll view?](#how-do-i-create-a-scroll-view)
  - [Navigation](#navigation)
    - [How do I navigate between pages?](#how-do-i-navigate-between-pages)
    - [How do I pop back manually?](#how-do-i-pop-back-manually)
  - [Threading and Asynchronous Programming](#threading-and-asynchronous-programming)
    - [How do I write asynchronous code?](#how-do-i-write-asynchronous-code)
    - [How do I produce streams of data asynchronously?](#how-do-i-produce-streams-of-data-asynchronously)
  - [Themes, Styles and Media](#themes-styles-and-media)
    - [How do I change to dark mode?](#how-do-i-change-to-dark-mode)
    - [How do I style my texts?](#how-do-i-style-my-texts)
    - [How do I style my buttons?](#how-do-i-style-my-buttons)
    - [How do I use custom fonts?](#how-do-i-use-custom-fonts)
    - [How do I bundle images in my app?](#how-do-i-bundle-images-in-my-app)
    - [How do I bundle videos in my app?](#how-do-i-bundle-videos-in-my-app)
  - [Networking, HTTP and JSON](#networking-http-and-json)
    - [How do I load network images?](#how-do-i-load-network-images)
    - [How do I make a GET request?](#how-do-i-make-a-get-request)
    - [How do I parse JSON?](#how-do-i-parse-json)
    - [How do I make a POST HTTP call with headers?](#how-do-i-make-a-post-http-call-with-headers)
  - [OS and Hardware Interaction](#os-and-hardware-interaction)
    - [How do I access user photos?](#how-do-i-access-user-photos)
    - [How do I access GPS coordinates?](#how-do-i-access-gps-coordinates)
    - [How do I access the camera?](#how-do-i-access-the-camera)
    - [How do I persist user settings?](#how-do-i-persist-user-settings)
    - [How do I access the accelerometer?](#how-do-i-access-the-accelerometer)

## UI Basics

In this section of the document we will discuss basic UI components and compare SwiftUI with Flutter. We will learn how to display static text, create buttons and react to their on-press events, display lists and grids and much more.

### How do I display static text?

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

### How do I add buttons?

In SwiftUI, you would create a button using the `Button` struct as shown here:

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

The `Button` struct in SwiftUI is constructed using an initializer, and various parameters that the initializer might require. In this case, we are using the initializer that takes in a `titleKey` parameter of type `LocalizedStringKey` and an action of type `@escaping () -> Void`.

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

One big difference here beteween native iOS development with SwiftUI and Flutter is that in SwiftUI, if you want a button, then you need to use the `Button` struct. But Flutter, being a multi-platform app development framework, you have access to variety of buttons that have pre-defined styles. The `TextButton` class comes from the *Material* package. A package is a set of source code files that are, well, packaged together. We will talk more about packages and Material soon but for now, if you're curious, you can read more about various widgets in the Material package by following [this link](https://docs.flutter.dev/development/ui/widgets/material).

### How do I align components horizontally?

In SwiftUI, stack views play a big part in designing your layouts. That's why there are two separate structures that allow you to create stacks:

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

### How do I align components vertically?

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

### How do I display a list view?

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

The initializer of the `List` struct in SwiftUI, like many other views that can have sub-views, has a view builder marked as `@ViewBuilder` which allows you to return a series of sub-views to be displayed as the content of that view, in this case, as contents of our list. This is more a convenience than it is the right way of creating lists in SwiftUI as the views that you insert for the contents of a `List` in SwiftUI cannot be more than 10 at a time. If you want to display more than 10 items at a time in a `List` in SwiftUI, you will most probably want to use the `ForEach` syntax or if your items are pure `String` instances, which ours are, you can get away by simply passing the strings to your `List` as shown here:

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

* The `ListView` widget has a builder method, much like SwiftUI's `List` struct has a view builder that is a closure.
* The `itemCount` parameter of the `ListView` in Flutter dictates how many items need to be displayed and rendered by the `ListView`.
* The `itemBuilder` then gets called with an index from and including 0 up to and excluding the item count, and must return a `Widget` instance per item.

In this example we are returning a `ListTile` per item but you could directly return a `Text` per item as well. The `ListTile` widget has some intrinsic properties such as a specific height and font size that might be quite helpful in building a good-looking list view but you're more than welcome to return almost any other widget that represents your data, per index.

### How do I display a grid?

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

### How do I create a scroll view?

In SwiftUI, if you want to create custom scrolling components, you would use the `ScrollView` struct. Let's say that you want to display a series of `User` struct instances on the screen in a vertically scrollable fashion. Your SwiftUI implementation might look similar to this:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/scrollview_in_swiftui/scrollview_in_swiftui/ContentView.swift (ScrollViewExample)"?> -->
```swift
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

1. we have a `Person` struct that represents the data each person would carry, such as name and age.
2. The `Person` struct conforms to the `Identifiable` protocol so that it can be used inside the `ForEach` view with ease.
3. Each person is then rendered using a dedicated `PersonView` view struct for the sake of reusability.

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

You can see a lot of similarities between the SwiftUI and the Flutter code for sure. Let's list them here:

* Each person is an instance of the `Person` struct in SwiftUI and the `Person` class in Flutter.
* The `PersonView` uses `Column` and `Row` in Flutter and `VStack` and `HStack` respectively in SwiftUI. We've talked about these before!
* SwiftUI uses `ScrollView` while Flutter uses `SingleChildScrollView` to render a child that is layed out in a scrollable fashion on the screen.

The major difference between `ScrollView` and `SingleChildScrollView` is that `ScrollView`'s initializer in SwiftUI has a `content` parameter which is a `@ViewBuidler` and can take up to 10 views directly to lay out though in our example the only view we are laying out is `ForEach` which in turn expands to displaying all instances of our `Person` struct. However, in Flutter, `SingleChildScrollView` has a single `child` parameter that takes just one `Widget` instance, in this case, our `Column` that roughly translates to the `ForEach` view in SwiftUI.

## Navigation

In this section of the document we will discuss navigation between pages of an app, the push and pop mechanism and more.

### How do I navigate between pages?

iOS and macOS apps are usually built out of different "pages" or navigation routes. This stack of pages is called navigation stack in SwiftUI and is represented by the `NavigationStack` struct that itself contains a list of navigation links represented by the `NavigationLink` struct. Going back to our `Person` struct, let's create an application that displays a list of persons and tapping on each person display's the person's details in a new navigation link. The `Person` and `PersonView` structs will stay *almost* the same as they were in the previous examples; the only thing we will change is to make sure the `Person` struct conforms to the `Hashable` protocol because the `navigationDestination()` function of `View` in SwiftUI requires that. We will then use `NavigationStack` and `NavigationLink` as shown here to create a list and then a details page for each person:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/navigation_in_swiftui/navigation_in_swiftui/ContentView.swift (NavigationExample)"?> -->
```swift
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
```

Navigation in Flutter is more decoupled from the declarative way of defining your user interface in that you need to define your navigation *routes* using a name of your choosing and after this definition, you can call upon your navigation routes using their names. The first part of this puzzle is to define the navigation routes and we do that when creating an instance of our application (the class instance that we pass to the `runApp()` function), as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/navigation_in_flutter/lib/main.dart (CupertinoAppExample)"?> -->
```dart
void main() {
  runApp(
    // we create an instance of our app
    // and pass it to the runApp function
    const App(),
  );
}

// define the name of the route as a constant so that
// you can not only use it to create the list of your app-routes,
// but also use it in the Navigator to push the route using
// its name
const detailsPageRouteName = '/details';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // the widget we return from here is a CupertinoApp
    // that has the look and feel of an iOS app by default
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // then you define your routes using a Map where the keys
      // to the map are the route names and the values are the
      // a function each of which receives a BuildContext and returns
      // a Widget
      routes: {
        detailsPageRouteName: (context) => const DetailsPage(),
      },
    );
  }
}
```

After defining our single route as a parameter of the `CupertinoApp` class, we can go ahead and display the list of persons that we had mocked using the `mockPersons()` function. Once the user taps on any of the persons in the list, we will use the `pushNamed()` function of `Navigator` in order to push the details page for that person using the `detailsPageRouteName` constant route name we defined earlier:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/navigation_in_flutter/lib/main.dart (HomePageWithListOfPeople)"?> -->
```dart
// This is stateless widget that displays the list of persons
// that we get from the mockPersons list and allows the user
// to tap each person to see their details
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Pick a person',
        ),
      ),
      child: Material(
        child: ListView.builder(
          itemCount: mockPersons.length,
          itemBuilder: (context, index) {
            final person = mockPersons.elementAt(index);
            final age = '${person.age} years old';
            return ListTile(
              title: Text(person.name),
              subtitle: Text(age),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                // when a ListTile that represents a person is
                // tapped, we push the detailsPageRouteName route
                // to the Navigator and pass the person's instance
                // to the route
                Navigator.of(context).pushNamed(
                  detailsPageRouteName,
                  arguments: person,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
```

As you can see, the `pushNamed()` function takes in two parameters:

* `String routeName`: this is the name of the route that we should have already defined at our app-level.
* `Object? arguments` an optional object to pass to the route as a parameter.

After handling the tapping event, we can go ahead and program our `DetailsPage` widget who is responsible for displaying the details of each person that should be passed to it as a parameter. In SwiftUI, since the navigation is tightly connected to the structure of the UI using `NavigationStack` and `NavigationLink`, you pass `Hashable` parameters that have to be sent to the details page into the `NavigationLink` and when the `navigationDestination()` function is called, you receive that `Hashable` object and can then directly instantiate your details page. In Flutter since the routes are defined at an app-level, where you have no idea of which object is selected or what object to pass to where, you need to dynamically pass these objects of type `Object?` to the route and at the receiving side, read them using `ModalRoute` as you can see here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/navigation_in_flutter/lib/main.dart (DetailsPageExample)"?> -->
```dart
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // read the person instance from the arguments
    final Person person = ModalRoute.of(
      context,
    )?.settings.arguments as Person;
    // extract the age
    final age = '${person.age} years old';
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          person.name,
        ),
      ),
      child: SafeArea(
        child: Material(
          // use a ListTile to display the person's
          // details since it already has a good layout
          child: ListTile(
            title: Text(person.name),
            subtitle: Text(age),
          ),
        ),
      ),
    );
  }
}
```

### How do I pop back manually?

In SwiftUI, In situations where your view needs to perform a manual pop-back to the previous screen, you should use the `dismiss` environment value as shown here. We have modified our `PersonView` struct from before and added a new button with the title of `"Pop back"` which the user can tap on in order to pop back to the previous screen:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/popback_in_swiftui/popback_in_swiftui/ContentView.swift (PopBackExample)"?> -->
```swift
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
```

In Flutter, to achieve the same effect, use the `pop()` function of the `Navigator` class as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/popback_in_flutter/lib/main.dart (PopBackExample)"?> -->
```dart
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Person person = ModalRoute.of(
      context,
    )?.settings.arguments as Person;
    final age = '${person.age} years old';
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          person.name,
        ),
      ),
      child: SafeArea(
        child: Material(
          child: Column(
            children: [
              ListTile(
                title: Text(person.name),
                subtitle: Text(age),
              ),
              TextButton(
                onPressed: () {
                  // this is the main code that allows the
                  // view to pop back to its presenter
                  Navigator.of(context).pop();
                },
                child: const Text('Pop back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Threading and Asynchronous Programming

Dart has a single-threaded execution model, with support for `Isolate`s (a way to run Dart codes on another thread), an event loop, and asynchronous programming. Unless you spawn an `Isolate`, your Dart code runs in the main UI thread and is driven by an event loop. Flutter’s event loop is equivalent to the iOS main loop - that is, the `Looper` that is attached to the main thread.

Dart's single-threaded model doesn't mean you are required to run everything as a blocking operation that causes the UI to freeze. Instead, use the asynchronous facilities that the Dart language provides, such as `async`/`await`, to perform asynchronous work.

### How do I write asynchronous code?

SwiftUI has support for asynchronous code using the `async` keyword. This keyword marks a function as performing asynchronous work and you can call these functions and wait until they return their results using the `await` keyword. You can use the `await` keyword while inside a `Task`. In Flutter, with Dart as the language behind it, you can also use `async` and `await` but you don't have to worry about using `@MainActor` unlike SwiftUI. In Swift, we have a more complicated concurrency and threading model where UI work can only be performed on the main/UI thread. Flutter, using a single-threaded model, you can fetch your data using `await` and immediately consume its results in your UI.

Let's say we want to write a function that fetches the weather asynchronously. In SwiftUI, you could go about doing this using a view model class that is marked as `@MainActor` and a `load()` function that internally calls an asynchronous function using `Task` or that the `load()` function is itself marked as `async`. Let's see an example of such a view model. First let's define our `Weather` enum:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_swiftui/async_in_swiftui/ContentView.swift (WeatherEnum)"?> -->
```swift
// a 1 second delay which we will use
// in our mocked-api-call in a moment
extension UInt64 {
  static let oneSecond = UInt64(1_000_000_000)
}

// the enum that represents our weather
enum Weather: String {
  case rainy, cloudy, sunny
}
```

After this, we will go about defining our view model and mark it as `ObservableObject` so that it can publish its `result` property of type `Weather?`:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_swiftui/async_in_swiftui/ContentView.swift (WeatherEnum)"?> -->
```swift
@MainActor class ContentViewModel: ObservableObject {
  @Published private(set) var result: Weather?
  
  func load() async {
    try? await Task.sleep(nanoseconds: .oneSecond)
    self.result = .sunny
  }
  
}
```

The `load()` async function is not marked as `throws` so it is not allowed to use the `try` syntax, rather it should use `try?`. In our view then we can go ahead and call the `load()` function of our view model and define our view model as a state object using `@StateObject`:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_swiftui/async_in_swiftui/ContentView.swift (ContentView)"?> -->
```swift
struct ContentView: View {
  // define your view model as a state object
  // so you can listen to its published properties
  @StateObject var viewModel = ContentViewModel()
  var body: some View {
    Text(viewModel.result?.rawValue ?? "Loading...")
      .task {
        // await on the "load()" function
        await viewModel.load()
      }
  }
}
```

Although we could have done all of this without a view model and with much less code, it's important to also show real-life examples and compare SwiftUI with Flutter in those cases too.

Flutter does not have the reactive model that SwiftUI has with `@MainActor`, `@Published` and `ObservableObject`. Instead, Flutter uses a much simpler model of using `Future` for work that will be done, well, in the future and completes after producing a value (or completes without producing a value). Flutter also has support for `Stream`, which is a class similar to `Future`. Whereas `Future` optionally produces maximum of 1 value, `Stream` can produce more than 1 value before it completes. To display the results of a `Future` on screen we will use a `FutureBuilder` and to display the results of a `Stream` we need to use `StreamBuilder`. Both these *builder* classes are essentially widgets that can be displayed in your widget-tree.

Let's start off by creating our `Weather` enum in Flutter:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_flutter/lib/main.dart (WeatherEnum)"?> -->
```dart
enum Weather {
  rainy,
  windy,
  sunny,
}
```

Then we can create a simple view model similiar to that which we created in SwiftUI that fetches the weather for us. Since in Flutter, `ObservableObject` is simply represented with either a `Future` or `Stream`, we can go ahead and simply return a `Future<Weather>` from a function within our view model like so:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_flutter/lib/main.dart (HomePageViewModel)"?> -->
```dart
@immutable
class HomePageViewModel {
  const HomePageViewModel();
  Future<Weather> load() async {
    await Future.delayed(const Duration(seconds: 1));
    return Weather.sunny;
  }
}
```

If you look at the `load()` function in our view model, you can see similarities to our SwiftUI code such as this: the `load()` function is marked as `async` because internally, it is using the `await` keyword. Note that Dart functions are marked with `async` only if they are using `await` inside them, but you can also write the same `load()` function without marking the function as `async`, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_flutter/lib/main.dart (HomePageViewModelWithoutAsync)"?> -->
```dart
class HomePageViewModel {
  const HomePageViewModel();
  Future<Weather> load() {
    return Future.delayed(const Duration(seconds: 1))
        .then((_) => Weather.sunny);
  }
}
```

This example is using the `then()` function on `Future<T>` which synchronously maps a `Future`'s value into another value. It's similar to how Combine works with its `map()` function but that's outside the scope of this section of the document.

Going back to our `load()` function marked as `async()`, you can also note that inside a function that is marked as `async`, you can simply use the `return` statement to synchronously return a value which then in turn will be placed inside the resulting `Future`. In other words, you don't have to create a `Future` instance manually inside functions that are marked as `async`. This is another similarity between our SwiftUI and Flutter code.

Now that our view model is in place, we can start writing our view code that consumes the `Future` returned by the `load()` function. Since it's a `Future` that we want to consume, we need to use the `FutureBuilder` widget in order to display the resulting `Weather` to the user:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_flutter/lib/main.dart (HomePage)"?> -->
```dart
class HomePage extends StatelessWidget {
  final HomePageViewModel viewModel = const HomePageViewModel();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // feed a FutureBuilder to your widget tree
      child: FutureBuilder<Weather>(
        // specify the Future that you want to track
        future: viewModel.load(),
        builder: (context, snapshot) {
          // a snapshot is of type `AsyncSnapshot` and contains the 
          // state of the Future. By looking if the snapshot contains
          // an error or if the data is null, you can decide what to
          // show to the user.
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
```

### How do I produce streams of data asynchronously?

Text

## Themes, Styles and Media

Flutter applications are very easy to style; you can easily switch between light and dark themes, change the style of your text and UI components and much more. In this section we will discuss some of the most important aspects of styling your Flutter apps and compare them with how you would do things in SwiftUI.

### How do I change to dark mode?

In SwiftUI, if you prefer use dark mode for your views, you can simply call the `preferredColorScheme()` function that is implemented on `View`, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/darktheme_in_swiftui/darktheme_in_swiftui/ContentView.swift (ContentView)"?> -->
```swift
@main
struct darktheme_in_swiftuiApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}
```

You just need to ensure to do the same function call on all views that prefer a dark color scheme. In Flutter, you control light and dark mode on the app-level using the `theme` property of your `CupertinoApp` class as shown  here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/darktheme_in_flutter/lib/main.dart (DarkModeExample)"?> -->
```dart
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
```

This modification will ensure all your widgets by default use the dark theme.

### How do I style my texts?

In SwiftUI, you would use modifier functions in order to modify the behavior of your UI components. For instance, you can change the font of a `Text` using the `font()` modifier function that has various overloads with different parameters and in turn returns a new `Text`. In other words, you chain your modifiers until you land with your final `Text` or UI component as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/textstyle_in_swiftui/textstyle_in_swiftui/ContentView.swift (StylingTextExample)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .font(.system(size: 30, weight: .heavy))
      .foregroundColor(.yellow)
  }
}
```

In Flutter, to style your texts, use the `style` parameter of your `Text` widget as shown here. This code achieves the same effect as the SwiftUI code prior to it:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/darktheme_in_flutter/lib/main.dart (DarkModeExample)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Cupertino',
        ),
      ),
      child: Center(
        child: Text(
          'Hello, world!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemYellow,
          ),
        ),
      ),
    );
  }
}
```

### How do I style my buttons?

Styling buttons in SwiftUI is similar to how you would style instances of `Text` as we've seen already. You would use modifier functions that are defined either on `View` itself or specifically on `Button` where the former modifiers will work on any `View` instance and the latter case where the modifiers are only applicable to `Button` instances. Let's see an example:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/buttonstyle_in_swiftui/buttonstyle_in_swiftui/ContentView.swift (StylingButtonExample)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Button("Do something") {
        // do something when button is tapped
      }
      .padding()
      .font(.system(size: 30, weight: .bold))
      .background(Color.yellow)
      .foregroundColor(Color.blue)
      .cornerRadius(20)
  }
}
```

You can achieve the same effect in Flutter by using the `CupertinoButton` widget and setting the style of its child and some of the other properties such as its background color on the button itself, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/buttonstyle_in_flutter/lib/main.dart (StylingButtonExample)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Cupertino',
        ),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.systemYellow,
          onPressed: () {},
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Do something',
            style: TextStyle(
              color: CupertinoColors.systemBlue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

One thing to note here is that in SwiftUI, you set the title of a button as a `String` object whereas in Flutter, since everything is a widget (or view as you'd know them in iOS), the title of the button itself is a widget so you assign a `Text` to the `child` property of your button and that becomes the title, or the child which you can style separately. So the knowledge you have about styling a `Text` widget comes in handy when styling a `CupertinoButton` since in this case the `child` of our button is in fact a `Text` widget!

### How do I use custom fonts?

In SwiftUI, to add and use a custom font in your application, you will need to first ensure that the font is part of your application binary by dragging it into your Xcode project. Then you will need to go to your target's Info tab and add the `UIAppFonts` key which is an array, and then add the path of your `.ttf` file as a child of this array. Once you've done that, you need to know the font-name in order to create a `Font` instance because the font name won't always match the name of the file for the font. You can always iterate through the font families available to your application using `UIFont.familyNames.forEach` and then for each family name, iterate the available font names using `UIFont.fontNames(forFamilyName:)`.

Once you have your font name, you can use the `.font()` modifier function in order to apply it to your UI components as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customfont_in_swiftui/customfont_in_swiftui/ContentView.swift (CustomFontExample)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Text("Hello")
      .font(
        Font.custom(
          "Roboto-Medium",
          size: 40
        )
      )
  }
}
```

In Flutter, you usually don't go about poking in platform specific files such as an Info.plist file so instead, you control your resources with a file called `pubspec.yaml`. To add a custom font to your project, follow these steps:

1. Create a folder called `fonts` (this is an optional step but quite neat to organize your fonts within the same folder) in your project's root directory.
2. Add your .ttf, .otf or .ttc font file(s) into your `fonts` folder.
3. Open the `pubspec.yaml` file within your project and find the `flutter` section and add your custom font(s) under the `fonts` section as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customfont_in_flutter/pubspec.yaml (FontFileInYaml)"?> -->
```yaml
flutter:
  fonts:
    - family: BungeeSpice
      fonts:
        - asset: fonts/BungeeSpice-Regular.ttf
```

After this, you can start using your font just like you did in the SwiftUI example, but this time in Flutter:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customfont_in_flutter/lib/main.dart (FontInTextExample)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text(
          'Hello',
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'BungeeSpice',
          ),
        ),
      ),
    );
  }
}
```

{{site.alert.secondary}}
  Check out [Google Fonts](https://fonts.google.com) to download custom fonts that you can use in your apps.
{{site.alert.end}}

### How do I bundle images in my app?

In SwiftUI, to add an image to your application, whether it's an SVG, PDF or JPG/PNG, you would usually add those images to your `Assets.xcassets` and then display those images using the `Image` view. Assuming that you've already added a single-scale image named "Blueberries.jpg" to your `Assets.xcassets`, you can then go ahead and display that image as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customimages_in_swiftui/customimages_in_swiftui/ContentView.swift (CustomImagesExample)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Image("Blueberries")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(
        maxWidth: 200,
        maxHeight: 200
      )
  }
}
```

In Flutter, assuming that you have added this image to your project structure inside a folder called `images/` so you end up with `images/Blueberries.jpg`, you need to first tell your Flutter application about this image inside the `pubspec.yaml` file as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customimages_in_flutter/pubspec.yaml (ImageInPubspecExample)"?> -->
```yaml
flutter:
  assets:
    - images/Blueberries.jpg
```

After defining your custom image, you can display it on the screen using the `Image` widget's `.asset()` constructor. This constructor instantiates the given image using the provided path and reads the image from the assets that are bundled with your app, and displays the image on the screen:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/customimages_in_flutter/lib/main.dart (CustomImageExample)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Image.asset(
          "images/Blueberries.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
```

### How do I bundle videos in my app?

To play a local video file bundled within your app in SwiftUI, you need to simply import the `AVKit` framework and create an instance of the `VideoPlayer` view. Let's say that we have a file called `movie.mov` which we have included in our app bundle. Here is how you could play that inside a video player in SwiftUI:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/bundledvideos_in_swiftui/bundledvideos_in_swiftui/ContentView.swift (BundledVideosExample)"?> -->
```swift
import AVKit

struct ContentView: View {
  var body: some View {
    if let url = Bundle.main.url(
      forResource: "movie",
      withExtension: "mov"
    ) {
      VideoPlayer(
        player: AVPlayer(
          url: url
        )
      )
    } else {
      Text("Could not find movie.mov file in app bundle")
    }
  }
}
```

In Flutter, to do the same thing, first you'll need to add the [video_player](https://pub.dev/packages/video_player) plugin to your project. This plugin allows you to create a video player that works on Android, iOS and on the web so with the same source code, you will have a video player that works on all 3 platforms. To add the `video_player` plugin to your Flutter project, use the `flutter pub add video_player` command in Terminal. This will add `video_player` to your `pubspec.yaml` file.

You then need to add the video file itself to your project. Assuming that you've created a folder called `videos` in your project's root folder and then placed the `movie.mov` file inside this folder, you'll need to ask Flutter to bundle this asset in your application by adding it to your `pubspec.yaml` file as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/bundledvideos_in_flutter/pubspec.yaml (AddingMovieToPubspec)"?> -->
```yaml
flutter:
  assets:
    - videos/movie.mov
```

After this, you can go ahead and use the `VideoPlayerController` class in order to load and play your video file, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/bundledvideos_in_flutter/lib/main.dart (BundledVideosExample)"?> -->
```dart
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // start the loading process
    _controller = VideoPlayerController.asset('videos/movie.mov')
      ..initialize().then(
        // once video is loaded, refresh your widget and ensure
        // the video player starts automatically and loops
        (_) => setState(
          () {
            _controller.setLooping(true);
            _controller.play();
          },
        ),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        // if video player is initialized meaning that its
        // asset is loaded, display the video player
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            // if video player is not initialized, display a
            // loading indicator
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
```

## Networking, HTTP and JSON

Networking is an important part of modern applications, be it mobile or web apps. In this section, we will have a look at similarities and differences between how SwiftUI and Flutter handle networking and learn more about Flutter's way of dealing with asynchronous network calls.

### How do I load network images?

In SwiftUI, to load a network image, you'd use the `AsyncImage` class as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/networkimages_in_swiftui/networkimages_in_swiftui/ContentView.swift (NetworkImageExample)"?> -->
```swift
let url = URL(
  string: "https://images.unsplash.com/photo-1521790797524-b2497295b8a0"
)

struct ContentView: View {
  var body: some View {
    AsyncImage(url: url) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
    } placeholder: {
      ProgressView()
    }
    .frame(
      maxWidth: 300,
      maxHeight: 300
    )
  }
}
```

In Flutter, to achieve the same results, you can simply use the `Image` class just like we did for local assets, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/networkimages_in_flutter/lib/main.dart (NetworkImageExample)"?> -->
```dart
const url = 'https://images.unsplash.com/photo-1521790797524-b2497295b8a0';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Image.network(
          url,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
```

### How do I make a GET request?

In SwiftUI, you can use the `URLSession` class to make an HTTP GET call and receive the data for a given URL as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/httpget_in_swiftui/httpget_in_swiftui/ContentView.swift (HttpGetCallExample)"?> -->
```swift
struct ContentView: View {
  // a state variable that keeps track of whether we
  // fetched our data or not
  @State var hasReceivedData = false
  var body: some View {
    Text(hasReceivedData ? "Got data" : "Loading...")
      // upon this text being displayed, attempt to retrieve the data
      // and associated the results with the state variable
      .task {
        self.hasReceivedData = (try? await loadData()) ?? false
      }
  }
  
  // this function will load the data for us
  func loadData() async throws -> Bool {
    guard let url = URL(
      string: "https://jsonplaceholder.typicode.com/posts"
    ) else {
      return false
    }
    let request = URLRequest(url: url)
    let (data, _) = try await URLSession.shared.data(for: request)
    // do something with the data here
    print(data.count)
    return true
  }
}
```

In Flutter, start off by adding the `http` package to your application by executing `flutter pub add http` in the terminal in the root folder of your project. Then go ahead and parse the data using the `http` package and display the results using `FutureBuilder` as demonstrated here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/httpget_in_flutter/lib/main.dart (HttpGetExample)"?> -->
```dart
const url = 'https://jsonplaceholder.typicode.com/posts';

Future<bool> loadData() async {
  final response = await http.get(Uri.parse(url));
  return response.statusCode == 200;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: FutureBuilder<bool>(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text('Got data');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
```

### How do I parse JSON?

In SwiftUI, to parse JSON you would first make classes that represent the parsed JSON, and make them conform to the `Codable` protocol. After that, you can use the `JSONDecoder` class to parse your JSON and assign the results to a simple `@State` variable to update your UI. Here is a very simple example of how you can go about doing this in SwiftUI:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/jsonparsing_in_swiftui/jsonparsing_in_swiftui/ContentView.swift (NetworkImageExample)"?> -->
```swift
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
```

In Flutter, we can start off by adding the `http` package to our application by executing `flutter pub add http` in the root folder of our application in the Terminal. Then we go ahead and define our `Post` model object and handle the JSON parsing inside it:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/jsonparsing_in_flutter/lib/main.dart (JsonObjectExample)"?> -->
```dart
@immutable
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];
}
```

Then we need to actually download the data for our JSON and parse it into an array of `Post` objects like so:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/jsonparsing_in_flutter/lib/main.dart (ParsingFutureExample)"?> -->
```dart
const url = 'https://jsonplaceholder.typicode.com/posts';

Future<Iterable<Post>> loadData() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final Iterable json = jsonDecode(response.body);
    return json.map((e) => Post.fromJson(e));
  } else {
    throw Exception('Failed to load data');
  }
}
```

Since now we have our `Future` instance, we can use `FutureBuilder` to consume it and turn it into a list view as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/jsonparsing_in_flutter/lib/main.dart (ConsumesJsonFutureExample)"?> -->
```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<Iterable<Post>>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material(
              child: ListView(
                children: snapshot.requireData
                    .map(
                      (post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
```

### How do I make a POST HTTP call with headers?

In SwiftUI, you can create an instance of `URLRequest` and change its `httpMethod` property to `"POST"` in order to send a POST HTTP request to a URL. You can also set header values on your `URLRequest` instance using the `setValue(:forHTTPHeaderField)` function of the request as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/httppost_in_swiftui/httppost_in_swiftui/ContentView.swift (HttpPostExample)"?> -->
```swift
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
```

In Flutter, you would start off by adding the `http` package to your application using `flutter pub add http` command in the terminal and then send your POST HTTP call using the `http` package. The result of your function that makes the call can be a `Future` which you can consume using a `FutureBuilder` as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/httppost_in_flutter/lib/main.dart (HttpPostExample)"?> -->
```dart
Future<String> postData() async {
  final response = await http.post(
    Uri.parse('https://reqbin.com/sample/post/json'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'key': 'value',
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to post data');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: FutureBuilder<String>(
          future: postData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.requireData);
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
```

## OS and Hardware Interaction

When developing applications, you'll most likely need to interact with *some* hardare features such as accessing the camera or the GPS coordinates. You might also need to be able to access the user's contacts information or photos on their device. In this section of the document, we will look at some of these features and how you can access them with Flutter.

### How do I access user photos?

In SwiftUI, in order to access user photos, you'll need to work with the `PhotosUI` framework by using `import PhotosUI`. After that, you'll need to create a bridge between vanilla Swift code and your SwiftUI code. The vanilla Swift code would access the photo album, and exposes the selected image using a binding, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/photopicker_in_swiftui/photopicker_in_swiftui/ContentView.swift (PhotoPickerExample)"?> -->
```swift
struct PhotoPicker: UIViewControllerRepresentable {
  
  let conf: PHPickerConfiguration
  @Binding var isPresented: Bool
  @Binding var image: UIImage?
  
  func makeUIViewController(
    context: Context
  ) -> UIViewController {
    let controller = PHPickerViewController(
      configuration: conf
    )
    controller.delegate = context.coordinator
    return controller
  }
  
  func updateUIViewController(
    _ uiViewController: UIViewController,
    context: Context
  ) {
    // empty for now
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  class Coordinator: PHPickerViewControllerDelegate {
    private let parent: PhotoPicker
    
    init(
      _ parent: PhotoPicker
    ) {
      self.parent = parent
    }
    
    func picker(
      _ picker: PHPickerViewController,
      didFinishPicking results: [PHPickerResult]
    ) {
      self.parent.isPresented = false
      guard let provider = results.first?.itemProvider else {
        return
      }
      if provider.canLoadObject(ofClass: UIImage.self) {
        provider.loadObject(ofClass: UIImage.self) { image, _ in
          self.parent.image = image as? UIImage
        }
      }
    }
  }
  
}
```

Once you have the picker, you can use it in your SwiftUI view using the required bindings:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/photopicker_in_swiftui/photopicker_in_swiftui/ContentView.swift (PhotoPickerViewExample)"?> -->
```swift
import PhotosUI

struct ContentView: View {
  
  @State private var isPresented = false
  @State private var image: UIImage?
  
  var body: some View {
    VStack {
      Button("Display photo picker") {
        isPresented.toggle()
      }.sheet(isPresented: $isPresented) {
        let conf = PHPickerConfiguration(
          photoLibrary: PHPhotoLibrary.shared()
        )
        PhotoPicker(
          conf: conf,
          isPresented: $isPresented,
          image: $image
        )
      }
      if image != nil {
        Image(uiImage: image!)
          .resizable()
          .frame(maxWidth: 200, maxHeight: 200)
      }
    }
  }
}
```

In Flutter, to access the photo library, you'll need to use the [image_picker](https://pub.dev/packages/image_picker) plugin. This package works on iOS, Android and the web so the Flutter code you'll write to access a user's gallery photos will work on all 3 aforementioned platforms. The `image_picker` package is really easy to work with. All you have to do is to call the `pickImage()` function of the `ImagePicker` class and `await` on its results, as shown here:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/photopicker_in_flutter/lib/main.dart (PhotoPickerExample)"?> -->
```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _picker = ImagePicker();
  Image? image;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            CupertinoButton(
              onPressed: () async {
                final result =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (result != null) {
                  final path = result.path;
                  final file = File(path);
                  // convert file to Image
                  setState(() {
                    image = Image.file(file);
                  });
                }
              },
              child: const Text('Pick Image'),
            ),
            if (image != null) image!,
          ],
        ),
      ),
    );
  }
}
```

### How do I access GPS coordinates?

Text

### How do I access the camera?

Text

### How do I persist user settings?

Text

### How do I access the accelerometer?

Text