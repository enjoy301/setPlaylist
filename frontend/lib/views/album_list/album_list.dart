import 'package:flutter/material.dart';
import 'package:idoru/views/album_list/album_list_widgets/album.dart';
import 'package:idoru/widgets/back_appbar.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  State<AlbumListScreen> createState() => _AlbumListScreen();
}

class _AlbumListScreen extends State<AlbumListScreen> {
  List<Map<String, dynamic>> albums = [
    {
      'name': "After Like",
      'color': Color(0xFF7DFB4F),
      'image': "AfterLIKE.png"
    },
    {'name': "LOVE DIVE", 'color': Color(0xFF099DF0), 'image': "LOVEDIVE.png"},
    {'name': "ELEVEN", 'color': Color(0xFFFD4532), 'image': "ELEVEN.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar("앨범 선택"),
      backgroundColor: Colors.black,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: albums.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return AlbumWidget(albumData: albums[index]);
        },
      ),
    );
  }
}
