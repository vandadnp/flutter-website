// docregion BundledVideosExample
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // start the loading process
    _controller = VideoPlayerController.asset('videos/movie.mov')
      ..initialize().then(
        // once video is loaded, refresh your widget and ensure
        // the video player starts automatically and loops
        (_) => setState(
          () {
            _controller.setLooping(true);
            _controller.play();
          },
        ),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        // if video player is initialized meaning that its
        // asset is loaded, display the video player
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            // if video player is not initialized, display a
            // loading indicator
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
// enddocregion BundledVideosExample

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
