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
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// #docregion WeatherEnum
enum Weather {
  rainy,
  windy,
  sunny,
}
// #enddocregion WeatherEnum

// #docregion HomePageViewModel
@immutable
class HomePageViewModel {
  const HomePageViewModel();
  Future<Weather> load() async {
    await Future.delayed(const Duration(seconds: 1));
    return Weather.sunny;
  }
}
// #enddocregion HomePageViewModel

// #docregion HomePageViewModelWithoutAsync
// @immutable
// class HomePageViewModel {
//   const HomePageViewModel();
//   Future<Weather> load() {
//     return Future.delayed(const Duration(seconds: 1))
//         .then((_) => Weather.sunny);
//   }
// }
// #enddocregion HomePageViewModelWithoutAsync

// #docregion HomePage
class HomePage extends StatelessWidget {
  final HomePageViewModel viewModel = const HomePageViewModel();
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // feed a FutureBuilder to your widget tree
      child: FutureBuilder<Weather>(
        // specify the Future that you want to track
        future: viewModel.load(),
        builder: (context, snapshot) {
          // a snapshot is of type `AsyncSnapshot` and contains the
          // state of the Future. By looking if the snapshot contains
          // an error or if the data is null, you can decide what to
          // show to the user.
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
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
// #enddocregion HomePage
