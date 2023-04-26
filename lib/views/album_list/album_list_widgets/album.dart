import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/pretendard_text.dart';
import '../../play_list/play_list.dart';

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({Key? key, required this.albumData}) : super(key: key);

  final Map<String, dynamic> albumData;

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 35,
        right: 25,
        left: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.lerp(widget.albumData['color'], Color(0x99000000), 0.5),
      ),
      child: InkWell(
        onTap: () {
          Get.to(PlayListScreen(albumName: widget.albumData['name']));
        },
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              child: Image.asset(
                "assets/images/${widget.albumData['image']}",
              ),
            ),
            PText(
              "${widget.albumData['name']}",
              size: 22,
              weight: FontWeight.w800,
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
  }
}
