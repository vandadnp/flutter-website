<!-- Notes for editors:

* I have done the code regions for code-excerpts but I am not sure how to link to files in specific folders so I've commented out those parts of the document for you to help with, please. I've added the correct paths, you just need to update the path so it works with the Flutter website. Thank you. -->

# Flutter for SwiftUI Developers

This document is for iOS developers who are comfortable developing their apps using SwiftUI. We have a separate document for UIKit which you're welcome to check out if you're more comfortable with UIKit.

Flutter is Google's modern UI framework; a declarative way of writing applications that run on multiple platforms, including iOS and Android. In this document, we will go through the similarities and differences between Flutter and SwiftUI and hopefully, by the end of it all, you will become more confident in your Flutter skills as a native iOS developer who uses SwiftUI.

- [Flutter for SwiftUI Developers](#flutter-for-swiftui-developers)
  - [UI Basics](#ui-basics)
    - [Views vs. Widgets](#views-vs.-widgets)
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
    - [How do I change to dark theme?](#how-do-i-change-to-dark-theme)
    - [How do I style my texts?](#how-do-i-style-my-texts)
    - [How do I style my buttons?](#how-do-i-style-my-buttons)
    - [How do I style my app globally?](#how-do-i-style-my-app-globally)
    - [How do I use custom fonts?](#how-do-i-use-custom-fonts)
    - [How do I bundle images with my app?](#how-do-i-bundle-images-with-my-app)
    - [How do I load network images?](#how-do-i-load-network-images)
    - [How do I load videos?](#how-do-i-load-videos)

## UI Basics

This section will cover how basic UI components in Flutter compare to those in SwiftUI. You will learn how to display static text, create buttons and react to their on-press events, display lists, grids and more.

### Views vs. Widgets

In SwiftUI, you use views to represent parts of your app's UI, and you can provide modifiers that you use to configure views. Flutter is similar in that it uses widgets to represent parts of your app's UI. Because SwiftUI and Flutter are both declarative, views and widgets simply describe how the UI should look and what it should do. Additionally, both views and widgets are immutable, meaning they only exist until they need to be changed. However, there are a few differences. For one, Flutter is designed to use compositiion rather than inhieritance. So instead of having every widget inherit from a base class with all the necessary properties, Flutter uses individual classes. This means that things that may normall be represented as modifiers in SwiftUI will be represented as separate widgets in Flutter. You'll see this in the examples shown below. 

<!-- TO DO: in general, is it helpful to mention that Flutter tends to be more verbose, but perhaps offers more options / flexibility? -->

### Displaying Static Text

As mentioned above, with SwiftUI most of what you create in the UI is done using view objects. These can act as containers, with each view having a series of subviews, that you specify declaratively in your Swift code. The example below will display a simple `"Hello, World!"` message to the center of the screen. 

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/rendering_text_swiftui/rendering_text_swiftui/ContentView.swift (SimpleText)"?> -->
```swift
struct ContentView: View {
  var body: some View {
    Text("Hello, World!")
  }
}
```

Flutter offers the ability to display static text on the screen using its `Text` widget. The example below shows the same `"Hello, World!"`, but in Flutter:

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

One thing to notice here is the use of the `Center` widget. In SwiftUI, a view's contents are by default rendered in its center but in Flutter that is not always the case. In the example, the `HomePage` widget uses the `Scaffold` widget. `Scaffold` implements the basic Material Design visual layout structure, so  you can easily start building a beautiful app.  However, `Scaffold` does not render its `body` widget at the center of the screen. So, to center the text, you have to wrap it with a `Center` widget. You can learn more about the different widgets and their default behaviors by looking through the [Widget Catalog]().

### Adding Buttons

In SwiftUI, you  create a button using the `Button` struct as shown here:

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

The `Button` struct in SwiftUI is constructed using an initializer, and various parameters that the initializer might require. In this case, the initializer  takes in a `titleKey` parameter of type `LocalizedStringKey` and an action of type `@escaping () -> Void`.

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

In SwiftUI if you want a button, then you need to use the `Button` struct. But with Flutter being a multi-platform framework, you have access to variety of buttons with pre-defined styles.

The `TextButton` class comes from the *Material* package that was referenced above. A package is a set of source code files that are packaged together. Pacakges and Material design will be discussed in more depth later in the document. You can read more about various widgets in the Material package by following [this link](https://docs.flutter.dev/development/ui/widgets/material).

### Aligning components horizontally

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

The equivalent of `HStack` in Flutter is `Row`. A row is a widget who, as its name implies, lays out its *children* horizontally, in a row. 

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

When calling `HStack` in SwiftUI, the example is calling the initializer with predefined `alignment` and `spacing`, so the only thing left to do is to pass a pair of curly brackets as the view builder. In Flutter, the `Row` widget requires `children` and expects a `List<Widget>`. A `List` in Dart is the equivalent of `Array` in Swift.

### Aligning components vertically

`HStack` and `Row` are used in SwiftUI and Flutter respectively in order to arrange UI components horizontally. Similarly, you can use the `VStack` and `Column`, in order to arrange your components vertically.

The example below builds on the one above, but this time arranging the components vertically:

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

The only thing that changed between this example and the previous was that `HStack` became `VStack`. The same holds true in Flutter, all your Dart code stays the same, except for changing `Row` to `Column`:

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

### Displaying a list view

In SwiftUI, the base component for displaying lists is `List`. In this example,  3 simple `Text` components are displayed as list-items inside the `List`:

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

The initializer of the `List` struct in SwiftUI, like many other views that can have sub-views, has a view builder marked as `@ViewBuilder` which allows you to return a series of sub-views to be displayed as the content of that view. In this case, as contents of the list. This way of creating lists in SwiftUI may be conveient, but if you have more than 10 items you will likely use `ForEach`, or if your items are `String` instances, you can simply pass the strings as shown here:

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

In many case, you have a list of model objects you want to display to the user. In those cases, you will need to ensure that your model objects are identifiable using the `Identifiable` protocol as shown here:

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

This is very similar to how Flutter prefers to build its list views, although Flutter doesn't need the list items to be identifiable. All you have to do is to tell Flutter how many items you want to display and then build a widget per item. In the example below, `ListView` is used as the parent for all list items. It displays its children one after another in the scroll direction:

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
* The `itemBuilder` then gets called with an index from, and including, 0 up to, and excluding, the item count - and must return a `Widget` instance per item.

In this example a `ListTile` is returned for each item. The `ListTile` widget has some intrinsic properties like height and font-size that may be helpful in building a list. However, you're able to return almost any widget that represents your data, per index.

### Displaying a grid

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
To display grids in Flutter, you use the [`GridView`](https://api.flutter.dev/flutter/widgets/GridView-class.html) widget. This widget has various constructors, each of which achieves more or less the same goal but with different input parameters. This example uses the `.builder()` initializer:

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

The delegate of type `SliverGridDelegateWithFixedCrossAxisCount` determines various parameters that the grid view will use to lay out its components, such as `crossAxisCount`, which is the number of items per row that will be displayed horizontally, and `mainAxisExtent`, which dictates the number of pixels each row must have.

One important distinction between SwiftUI's `Grid` and Flutter's `GridView` is that in SwiftUI the `Grid` view is fed with instances of `GridRow`, but in Flutter `GridView` uses the delegate to decide how the grid should lay out its components.

The term *axis* is something that you'll come across often on your journey to learn Flutter. Within a widget, the  and cross axes depdend on the behvaior of that widget. For example, with `GridView`, the main axis is vertical because they lay out their rows vertically, and the cross axis would be horizontal. There are different properties that are associated with the axes which can be used to space out widgets, [you can learn more here](https://docs.flutter.dev/codelabs/layout-basics#axis-size-and-alignment). 

<!-- TO DO: Does this approach by Flutter offer more flexibility? -->


### Creating a Scroll View

In SwiftUI, if you want to create custom scrolling components, you would use the `ScrollView` struct. Say that you want to display a series of `User` struct instances on the screen in a vertically scrollable fashion. Your SwiftUI implementation might look similar to this:

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

In this example there are a few aspects that resemble production-level code:

1. There is a `Person` struct that represents the data associated with each person, such as name and age.
2. The `Person` struct conforms to the `Identifiable` protocol so that it can be used inside the `ForEach` view with ease.
3. Each person is then rendered using a dedicated `PersonView` view for the sake of reusability.

The closest equivalent of `ScrollView` in Flutter is `SingleChildScrollView`:

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

// create a widget (view in SwiftUI),
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

// create a list of people
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
      // display the list of people on the screen 
      // inside a scroll view of type
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

There are a lot of similarities between the SwiftUI and the Flutter code, for example:

* Each person is an instance of the `Person` struct in SwiftUI and the `Person` class in Flutter.
* The `PersonView` uses `Column` and `Row` in Flutter and `VStack` and `HStack` respectively in SwiftUI. We've talked about these before!
* SwiftUI uses `ScrollView` while Flutter uses `SingleChildScrollView` to render a child that is layed out in a scrollable fashion on the screen.

The major difference between `ScrollView` and `SingleChildScrollView` is that `ScrollView`'s initializer in SwiftUI has a `content` parameter that is a `@ViewBuidler`. This can only directly take up to 10 views to lay out. However, `ForEach` can be used to display all instances - like in the example above, where it is used to display all instances of the `Person` struct. On the other hand, in Flutter, `SingleChildScrollView` has a single `child` parameter that takes just one `Widget` instance. In the example, this would be the `Column` widget, which that roughly translates to the `ForEach` view in SwiftUI.

<!-- TO DO: How is wanting a scrollable view/widget different from a list, what are the cases where you would use one or the other? -->


## Navigation

In this section of the document will discuss navigation between pages of an app, the push and pop mechanism and more.

### How do I navigate between pages?

iOS and macOS apps are usually built out of different "pages" or navigation routes. This stack of pages is called a navigation stack in SwiftUI and is represented by the `NavigationStack` struct that contains a list of navigation links represented by the `NavigationLink` struct. Going back to the `Person` struct used in the previous example, the next example creates an application that displays a list of persons, and tapping on each person display's the person's details in a new navigation link. The `Person` and `PersonView` structs will stay almost the same as they were in the previous examples; the only thing that will change is the `Person` struct conforms to the `Hashable` protocol because that is what the `navigationDestination()` function of `View` in SwiftUI requires.  

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

Navigation in Flutter is more decoupled from the declarative way of defining your user interface in that you need to define your navigation *routes* using a name of your choosing. After this definition, you can call upon your navigation routes using their names. The first part of this puzzle is to define the navigation routes and we do that when creating an instance of the application (the class instance that we pass to the `runApp()` function), as shown here:

<!-- TO DO: What benefit does this approach to navigation offer? Making it easier to use in the navigator? -->

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
    // the widgetreturned here is a CupertinoApp
    // that has the look and feel of an iOS app by default
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // then you define your routes using a Map where the keys
      // to the map are the route names and the values are the function
      // each of which receives a BuildContext and returns a Widget
      routes: {
        detailsPageRouteName: (context) => const DetailsPage(),
      },
    );
  }
}
```
In the example, the [`CupertinoApp`](https://api.flutter.dev/flutter/cupertino/CupertinoApp-class.html) widget is used to build an application that uses Cupertino design. Cupertino widgets are styled to look like native iOS applications, and `CupertinoApp` wraps widgets to offer iOS specific defaults like fonts and scrolling physics. Here, the single route was used as a parameter of the `CupertinoApp` class.  Next, list of persons that was mocked using the `mockPersons()` function will need to be displayed. Once the user taps on any person,  the `pushNamed()` function  will be used to push the person's detail page to the from the `Navigator`  using the `detailsPageRouteName` that was defined earlier:

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

* `String routeName`: this is the name of the route that should have already been defined at the app-level.
* `Object? arguments`: an optional object to pass to the route as a parameter.

After handling the tapping event, the next step is to define the `DetailsPage` widget that is responsible for displaying the details of each person. In SwiftUI, the navigation is tightly connected to the structure of the UI using `NavigationStack` and `NavigationLink`, so you pass `Hashable` parameters that have to be sent to the details page into the `NavigationLink`. When the `navigationDestination()` function is called, you receive that `Hashable` object and can then directly instantiate your details page. In Flutter the routes are defined at the app-level, where you don't know which object is selected or what object to pass to where. Instead, arguments need to be dynamically passed into the new route. The widget below extracts the arguments using `ModalRoute.of()`:

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

### Manually Pop Back

In SwiftUI, in situations where your view needs to perform a manual pop-back to the previous screen, you use the `dismiss` environment value as shown here. In this example, a new button, with the title of `"Pop back"`, has been added to the the `PersonView` struct. When the user taps on this button, they pop back to the previous screen:

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

### Writing asynchronous code

SwiftUI has support for asynchronous code using the `async` keyword. This keyword marks a function as performing asynchronous work and you can call these functions and wait until they return their results using the `await` keyword. You can use the `await` keyword while inside a `Task`. In Flutter, with Dart as the language behind it, you can also use `async` and `await` but you don't have to worry about using `@MainActor` - like you would with SwiftUI. In Swift, we have a more complicated concurrency and threading model where UI work can only be performed on the main/UI thread. With Flutter, using a single-threaded model, you can fetch your data using `await` and immediately consume the results in your UI.

Say you want to write a function that fetches the weather asynchronously. In SwiftUI, you could do this using a view model class that is marked as `@MainActor`, and a `load()` function that internally calls an asynchronous function using `Task`, or have the `load()` function itself marked as `async`. Below is an example of this view model. The first step is to define the `Weather` enum:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_swiftui/async_in_swiftui/ContentView.swift (WeatherEnum)"?> -->
```swift
// a 1 second delay is used
// in the mocked-api-call in a moment
extension UInt64 {
  static let oneSecond = UInt64(1_000_000_000)
}

// the enum that represents our weather
enum Weather: String {
  case rainy, cloudy, sunny
}
```

The next step is to define the view model and mark it as `ObservableObject` so that it can publish its `result` property of type `Weather?`:

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

Because the `load()` async function is not marked as `throws`, it must use the `try?` syntax.  Next, the view model is defined as a state object using `@StateObject`, and the `load()` function can be called by the view model:

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

Although this could have been done without a view model, and with much less code, the goal of this document is to compare SwiftUI with Flutter through real-life examples.

Flutter does not have the reactive model that SwiftUI has with `@MainActor`, `@Published` and `ObservableObject`. Instead, Flutter uses a much simpler model of using `Future` for work that will be done in the future, and completes after producing a value (or completes without producing a value). Flutter also has support for `Stream`, which is a class similar to `Future`. Whereas `Future` optionally produces maximum of 1 value, `Stream` can produce more than 1 value before it completes. To display the results of a `Future` on screen you use a `FutureBuilder`. To display the results of a `Stream` you use `StreamBuilder`. Both these *builder* classes are essentially widgets that can be displayed in the widget-tree.

In this example, the first step is to create the `Weather` enum in Flutter:

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/async_in_flutter/lib/main.dart (WeatherEnum)"?> -->
```dart
enum Weather {
  rainy,
  windy,
  sunny,
}
```

Then a simple view model, similiar to that which was created in SwiftUI, is created to fetch the weather. In Flutter, `ObservableObject` is simply represented by either a `Future` or `Stream`, so you can simply return a `Future<Weather>` from a function within the view model:

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

If you look at the `load()` function in the view model, you can see similarities to the SwiftUI code: the `load()` function is marked as `async` because internally, it is using the `await` keyword. Note that Dart functions are marked with `async` only if they are using `await` inside them, but you can also write the same `load()` function without marking the function as `async`, as shown here:

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

This example is using the `then()` function on `Future<T>` which synchronously maps a `Future`'s value into another value. It's similar to how Combine works with its `map()` function, but that's outside the scope of this section of the document.

Going back to `load()`, you can also note that inside a function that is marked as `async`, you can simply use the `return` statement to synchronously return a value that is placed inside the resulting `Future`. In other words, you don't have to create a `Future` instance manually inside functions that are marked as `async`. This is another similarity between SwiftUI and Flutter.

Now that the view model is in place, the view code that consumes the `Future` returned by the `load()` function can be created. Because a `Future` is needed, the `FutureBuilder` widget can be used to display the resulting `Weather` to the user:

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

Text

### How do I change to dark theme?

Text

### How do I style my texts?

Text

### How do I style my buttons?

Text

### How do I style my app globally?

Text

### How do I use custom fonts?

Text

### How do I bundle images with my app?

Text

### How do I load network images?

Text

### How do I load videos?

Text
