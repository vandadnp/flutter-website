import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

// #docregion JsonObjectExample
@immutable
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];
}
// #enddocregion JsonObjectExample

// #docregion ParsingFutureExample
const url = 'https://jsonplaceholder.typicode.com/posts';

Future<Iterable<Post>> loadData() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final Iterable json = jsonDecode(response.body);
    return json.map((e) => Post.fromJson(e));
  } else {
    throw Exception('Failed to load data');
  }
}
// #enddocregion ParsingFutureExample

// #docregion ConsumesJsonFutureExample
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<Iterable<Post>>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material(
              child: ListView(
                children: snapshot.requireData
                    .map(
                      (post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      ),
                    )
                    .toList(),
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
// #enddocregion ConsumesJsonFutureExample
