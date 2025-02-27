import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

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


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: 
          // #docregion OpenAppExample
          CupertinoButton(
            onPressed: () async {
              await launchUrl(
                Uri.parse('https://google.com'),
              );
            },
            child: const Text(
              'Open website',
            ),
          ),
          // #enddocregion OpenAppExample
        ),
      ),
    );
  }
}