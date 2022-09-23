import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// #docregion AppStorageExample
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final pref = snapshot.requireData;
                return CupertinoTextField(
                  placeholder: 'Enter your username here',
                  controller: TextEditingController(
                    text: pref.getString('username') ?? '',
                  ),
                  onChanged: (value) {
                    pref.setString('username', value);
                  },
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
// #enddocregion AppStorageExample