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
  - [How do I display a grid view?](#how-do-i-display-a-grid-view)
  - [How do I create a page that scrolls?](#how-do-i-create-a-page-that-scrolls)

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

<!-- <?code-excerpt "examples/get-started/flutter-for/ios_devs_swiftui/hstack_in_flutter/lib/main.dart (SimpleColumn)"?> -->
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

## How do I display a grid view?

## How do I create a page that scrolls?