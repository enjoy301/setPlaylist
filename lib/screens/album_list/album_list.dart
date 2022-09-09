import 'package:flutter/material.dart';
import 'package:idoru/screens/play_list/play_list.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  State<AlbumListScreen> createState() => _AlbumListScreen();
}

class _AlbumListScreen extends State<AlbumListScreen> {
  List<List<dynamic>> albums = [
    ["After Like", 0xFF7DFB4F, "AfterLIKE.png"],
    ["LOVE DIVE", 0xFF099DF0, "LOVEDIVE.png"],
    ["ELEVEN", 0xFFFD4532, "ELEVEN.png"]
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
                  child: Image.asset(
                    "assets/images/back_sign.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Text(
                  "앨범 선택",
                  style: TextStyle(color: Colors.white),
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
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayListScreen(
                          albumName: albums[index][0],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Color(albums[index][1]),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/${albums[index][2]}",
                        ),
                        Text(
                          albums[index][0],
                          style: TextStyle(
                            color: Colors.white,
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
