import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pod_player/pod_player.dart';

class SongPlayScreen extends StatefulWidget {
  final String youtubeId;
  const SongPlayScreen({Key? key, required this.youtubeId}) : super(key: key);

  @override
  State<SongPlayScreen> createState() => _SongPlayStateScreen();
}

class _SongPlayStateScreen extends State<SongPlayScreen> {
  late PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  loadVideo() async {
    final urls = await PodPlayerController.getYoutubeUrls(
      'https://www.youtube.com/watch?v=xOuXYe-3Y1I',
    );

    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(
        videoUrls: urls!,
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        isLooping: false,
        videoQualityPriority: [2160, 1440, 1080, 720, 480, 360, 240, 144],
      ),
    )..initialise();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: loadVideo(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //You you finish the initialization
            return PodVideoPlayer(
              controller: _controller,
            );
          }
          //Until the data get
          else {
            return Center(
              child: Text(
                "Splash Screen",
              ),
            );
          }
        }),
      )),
    );
  }
}
