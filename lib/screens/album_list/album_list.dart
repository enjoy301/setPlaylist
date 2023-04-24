import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/screens/play_list/play_list.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  State<AlbumListScreen> createState() => _AlbumListScreen();
}

class _AlbumListScreen extends State<AlbumListScreen> {
  List<List<dynamic>> albums = [
    ["After Like", Color(0xFF7DFB4F), "AfterLIKE.png"],
    ["LOVE DIVE", Color(0xFF099DF0), "LOVEDIVE.png"],
    ["ELEVEN", Color(0xFFFD4532), "ELEVEN.png"]
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
                Text(
                  "앨범 선택",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pretendard',
                  ),
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
                return Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 15,
                    bottom: 40,
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.lerp(albums[index][1], Color(0x99000000), 0.5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(PlayListScreen(albumName: albums[index][0]));
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 20),
                          child: Image.asset(
                            "assets/images/${albums[index][2]}",
                          ),
                        ),
                        Text(
                          albums[index][0],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        // Image right end sort
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            "assets/images/next_sign.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
