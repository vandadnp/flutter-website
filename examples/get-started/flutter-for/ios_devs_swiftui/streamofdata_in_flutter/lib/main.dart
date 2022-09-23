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

// #docregion TimerExample
Stream<DateTime> dateTime() => Stream.periodic(
      const Duration(seconds: 1),
      (int count) => DateTime.now(),
    );

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: StreamBuilder<DateTime>(
            stream: dateTime(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.requireData.toIso8601String(),
                );
              } else {
                return const CupertinoActivityIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
// #enddocregion TimerExample