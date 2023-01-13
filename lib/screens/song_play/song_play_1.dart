import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongPlayScreen extends StatefulWidget {
  final String youtubeId;
  const SongPlayScreen({Key? key, required this.youtubeId}) : super(key: key);

  @override
  State<SongPlayScreen> createState() => _SongPlayStateScreen();
}

class _SongPlayStateScreen extends State<SongPlayScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: "ELLCf9W2vAo",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: true,
        enableCaption: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
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
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
          builder: (context, player) {
            return Scaffold(
              body: SafeArea(
                child: ListView(
                  children: [
                    player,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
