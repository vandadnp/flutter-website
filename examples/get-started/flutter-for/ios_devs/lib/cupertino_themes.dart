import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const
        // #docregion Theme
        CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
    // #enddocregion Theme
  }
}

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
        child:
            // #docregion StylingTextExample
            Text(
          'Hello, world!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemYellow,
          ),
        ),
        // #enddocregion StylingTextExample
      ),
    );
  }
}
