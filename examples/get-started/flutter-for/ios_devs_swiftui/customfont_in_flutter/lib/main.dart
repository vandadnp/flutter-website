import 'package:flutter/cupertino.dart';

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
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// docregion FontInTextExample
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
// enddocregion FontInTextExample
