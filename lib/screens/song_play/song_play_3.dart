import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SongPlayScreen extends StatefulWidget {
  final String youtubeId;
  const SongPlayScreen({Key? key, required this.youtubeId}) : super(key: key);

  @override
  State<SongPlayScreen> createState() => _SongPlayStateScreen();
}

class _SongPlayStateScreen extends State<SongPlayScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
