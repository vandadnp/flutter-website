import 'package:flutter/cupertino.dart';
import 'package:sensors_plus/sensors_plus.dart';

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

// #docregion AccelerometerExample
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEvents,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Accelerometer: ${snapshot.requireData.description}',
                );
              } else {
                return const Text('Accelerometer: null');
              }
            },
          ),
        ),
      ),
    );
  }
}

extension Description on AccelerometerEvent {
  String get description => 'x: ${x.toStringAsFixed(2)}, '
      'y: ${y.toStringAsFixed(2)}, '
      'z: ${z.toStringAsFixed(2)}';
}
// #enddocregion AccelerometerExample