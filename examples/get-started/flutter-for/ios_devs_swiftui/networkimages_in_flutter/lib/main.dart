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

// #docregion NetworkImageExample
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
// #enddocregion NetworkImageExample
