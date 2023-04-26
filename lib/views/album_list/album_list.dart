import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/views/album_list/album_list_widgets/album.dart';

import '../../widgets/pretendard_text.dart';

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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    right: 15,
                    bottom: 30,
                    left: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/images/back_sign.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                PText(
                  "앨범 선택",
                  size: 40,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            ListView.builder(
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
          ],
        ),
      ),
    );
  }
}
