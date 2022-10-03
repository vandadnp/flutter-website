import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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

// #docregion PhotoPickerExample
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _picker = ImagePicker();
  Image? image;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            CupertinoButton(
              onPressed: () async {
                final result =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (result != null) {
                  final path = result.path;
                  final file = File(path);
                  // convert file to Image
                  setState(() {
                    image = Image.file(file);
                  });
                }
              },
              child: const Text('Pick Image'),
            ),
            if (image != null) image!,
          ],
        ),
      ),
    );
  }
}
// #enddocregion PhotoPickerExample
