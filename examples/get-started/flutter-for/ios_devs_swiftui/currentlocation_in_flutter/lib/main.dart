import 'package:geolocator/geolocator.dart';
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

// #docregion GetLocationExample
Future<Position> getLocation() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    return Future.error('Location services are disabled.');
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Denied forever');
  }

  return await Geolocator.getCurrentPosition();
}
// #enddocregion GetLocationExample

// #docregion GetLocationWidgetExample
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: FutureBuilder<Position>(
          future: getLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final position = snapshot.requireData;
              final text =
                  'Location: ${position.latitude}, ${position.longitude}';
              return Center(
                child: Text(
                  text,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
// #enddocregion GetLocationWidgetExample