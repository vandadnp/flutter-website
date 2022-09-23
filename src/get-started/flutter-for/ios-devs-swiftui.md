<!-- Notes for editors:

* I have done the code regions for code-excerpts but I am not sure how to link to files in specific folders so I've commented out those parts of the document for you to help with, please. I've added the correct paths, you just need to update the path so it works with the Flutter website. Thank you. -->

# Flutter for SwiftUI Developers

This document is for iOS developers who are comfortable developing their apps using SwiftUI. We have a separate document for UIKit which you're welcome to check out if you're more comfortable with UIKit.

Flutter is Google's modern UI framework; a declarative way of writing applications that run on multiple platforms, including iOS and Android. In this document, we will go through the similarities and differences between Flutter and SwiftUI and hopefully, by the end of it all, you will become more confident in your Flutter skills as a native iOS developer who uses SwiftUI.

- [Flutter for SwiftUI Developers](#flutter-for-swiftui-developers)
  - [Rendering Text](#rendering-text)
  - [Rendering Buttons](#rendering-buttons)

## Rendering Text

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

## Rendering Buttons

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
