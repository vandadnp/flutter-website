import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

// #docregion HttpPostExample
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
// #enddocregion HttpPostExample
