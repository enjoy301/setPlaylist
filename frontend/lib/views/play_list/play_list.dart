import 'package:flutter/material.dart';
import 'package:idoru/views/play_list/play_list_widgets/player_card.dart';
import 'package:idoru/widgets/back_appbar.dart';

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
      appBar: BackAppbar(
        "장원영",
        subtitle: "/아이브",
        textColor: Colors.black,
        backgroundColor: Color(0xFF7DFB4F),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 5,
                right: 15,
                bottom: 5,
                left: 15,
              ),
              height: 58,
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
                            : Color(0xFFD9D9D9),
                      ),
                      margin: EdgeInsets.only(
                        top: 10,
                        right: 5,
                        bottom: 10,
                        left: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 14.0,
                          right: 14.0,
                        ),
                        child: Center(
                          child: PText(
                            company[index],
                            color:
                                selected != index ? Colors.white : Colors.black,
                            weight: FontWeight.w400,
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
