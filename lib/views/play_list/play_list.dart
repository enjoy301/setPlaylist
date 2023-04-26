import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/views/play_list/play_list_widgets/player_card.dart';

import '../../widgets/pretendard_text.dart';

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
            PText(
              "장원영",
              weight: FontWeight.w800,
              size: 30,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: PText(
                "/아이브",
                weight: FontWeight.w800,
                size: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF7DFB4F),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Get.back();
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
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return GestureDetector(
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
                          child: PText(
                            company[index],
                            color:
                                selected != index ? Colors.white : Colors.black,
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
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return PlayerCardWidget(youtubeId: youtubeId[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
