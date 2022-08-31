import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:idoru/screens/idol_detail/idol_detail.dart';
import 'package:idoru/screens/idol_select/idol_select.dart';

final List<String> imgList = [
  'assets/images/list_image_1.png',
  'assets/images/list_image_2.png',
  'assets/images/list_image_1.png',
  'assets/images/list_image_2.png',
];

class IdolListScreen extends StatefulWidget {
  const IdolListScreen({Key? key}) : super(key: key);

  @override
  State<IdolListScreen> createState() => _IdolListScreen();
}

class _IdolListScreen extends State<IdolListScreen> {
  int _current = 0;
  File? mPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF27282A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "플레이 리스트",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return IdolSelectScreen();
                        },
                      );
                    },
                    child: Image.asset(
                      "assets/images/plus_button.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CarouselSlider(
                items: imgList
                    .map(
                      (item) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IdolDetailScreen()),
                          );
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "커버 이미지 바꾸기",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Text(
                                          "다른 사진으로 바꿀 수 있어요!",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.all(20),
                                              side: BorderSide(
                                                color: Color(0xFF72B8AB),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              backgroundColor:
                                                  Color(0xFF27282B)),
                                          onPressed: () {
                                            _onPhoto();
                                          },
                                          child: Text(
                                            "앨범에서 선택하기",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF72B8AB),
                                              fontWeight: FontWeight.w800,
                                            ),
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
                                  item,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          '장원영',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '/아이브',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 500,
                  // aspectRatio: 1,
                  viewportFraction: 0.8,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.only(
                        bottom: 50.0,
                        left: 5.0,
                        right: 5.0,
                        top: 5.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? Color(0xFF72B8AB)
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _onPhoto() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(xfile?.path as String);
    print("wowowow ${file.path}");
  }
}
