import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/MyIdolController.dart';
import '../../screens/album_list/album_list.dart';
import '../common/pretendard_text.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyIdolController());

    return InkWell(
      onTap: () {
        Get.to(AlbumListScreen());
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF27282A),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PText(
                        "커버 이미지 바꾸기",
                        size: 30,
                      ),
                      PText(
                        "다른 사진으로 바꿀 수 있어요!",
                        size: 20,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            side: BorderSide(
                              color: Color(0xFF72B8AB),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Color(0xFF27282B)),
                        onPressed: () {
                          _onPhoto();
                        },
                        child: PText(
                          "앨범에서 선택하기",
                          size: 15,
                          color: Color(0xFF72B8AB),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              3.0,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Image.asset(
                "${controller.idolData[widget.id]!['image']}",
                fit: BoxFit.cover,
                width: 1000.0,
                height: 2000.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PText(
                        "${controller.idolData[widget.id]!['name']}",
                        size: 40.0,
                        weight: FontWeight.bold,
                      ),
                      PText(
                        '/${controller.idolData[widget.id]!['group']}',
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPhoto() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(xfile?.path as String);
    debugPrint("wowowow ${file.path}");
  }
}
