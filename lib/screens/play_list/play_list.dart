import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayListScreen extends StatefulWidget {
  final String albumName;
  const PlayListScreen({Key? key, required this.albumName}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreen();
}

class _PlayListScreen extends State<PlayListScreen> {
  List<String> youtubeId = ["DqvMi7J_juM", "ELLCf9W2vAo", "ezEYcU9Pp_w", "UJ3u6NzuSig", "xOuXYe-3Y1I"];

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: youtubeId.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return InkWell(
            onTap: () async {
              await LaunchApp.openApp(
                androidPackageName: 'com.google.android.youtube',
              );
            },
            child: Image.network(
              YoutubePlayer.getThumbnail(
                quality: ThumbnailQuality.max,
                videoId: youtubeId[index],
              ),
            ),
          );
        },
      )),
    );
  }
}
