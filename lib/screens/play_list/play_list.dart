import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayListScreen extends StatefulWidget {
  final String albumName;

  const PlayListScreen({Key? key, required this.albumName}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreen();
}

class _PlayListScreen extends State<PlayListScreen> {
  List<String> youtubeId = [
    "DqvMi7J_juM",
    "ELLCf9W2vAo",
    "ezEYcU9Pp_w",
    "UJ3u6NzuSig",
    "xOuXYe-3Y1I"
  ];
  List<String> company = ["KBS", "SBS", "MBC", "엠카", "쇼챔", "기타", "기타2", "기타3"];
  int selected = 0;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              "장원영",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "/아이브",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF7DFB4F),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: company.length,
                itemBuilder: (BuildContext context,
                    int index,) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: selected != index
                            ? Colors.transparent
                            : Colors.white,
                      ),
                      margin: EdgeInsets.only(
                        top: 10,
                        right: 5,
                        bottom: 10,
                        left: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Center(
                          child: Text(
                            company[index],
                            style: selected != index
                                ? TextStyle(color: Colors.white)
                                : TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: youtubeId.length,
                itemBuilder: (BuildContext context,
                    int index,) {
                  return InkWell(
                    onTap: () async {
                      launchUrl(
                        Uri.parse(
                          "https://www.youtube.com/watch?v=${youtubeId[index]}",
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        right: 15,
                        bottom: 10,
                        left: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF7DFB4F),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            YoutubePlayer.getThumbnail(
                              quality: ThumbnailQuality.max,
                              videoId: youtubeId[index],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 3,
                              bottom: 3,
                            ),
                            child: Text(
                              "After Like",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
