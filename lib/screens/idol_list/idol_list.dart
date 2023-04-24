import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/screens/idol_select/idol_select.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/MyIdolController.dart';
import '../album_list/album_list.dart';

final Map<int, Map<String, dynamic>> idolData = {
  0: {
    'image': 'assets/images/profile/jang1.jpeg',
    'name': '장원영',
    'group': '아이브',
  },
  1: {
    'image': 'assets/images/profile/kim1.jpg',
    'name': '김채원',
    'group': '르세라핌',
  },
  2: {
    'image': 'assets/images/profile/li1.jpg',
    'name': '리즈',
    'group': '아이브',
  },
  3: {
    'image': 'assets/images/profile/ha1.png',
    'name': '하니',
    'group': '뉴진스',
  },
};

class IdolListScreen extends StatefulWidget {
  const IdolListScreen({Key? key}) : super(key: key);

  @override
  State<IdolListScreen> createState() => _IdolListScreen();
}

class _IdolListScreen extends State<IdolListScreen> {
  File? mPhoto;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyIdolController());

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
                      fontFamily: 'Pretendard',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        IdolSelectScreen(),
                        barrierColor: Colors.black,
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
              child: Obx(
                () => (CarouselSlider(
                  options: CarouselOptions(
                    height: 500,
                    // aspectRatio: 1,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      controller.setCurrentPage(index);
                    },
                  ),
                  carouselController: controller.carouselController.value,
                  items: controller.myIdolIdList.map((id) {
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
                                            backgroundColor: Color(0xFF27282B)),
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
                                idolData[id]!['image'],
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
                                      Text(
                                        idolData[id]!['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '/${idolData[id]!['group']}',
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
                    );
                  }).toList(),
                )),
              ),
            ),
            Obx(
              () => (Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    controller.myIdolIdList.length, (index) => index).map(
                  (index) {
                    return Container(
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
                        color: controller.currentPage.value == index
                            ? Color(0xFF72B8AB)
                            : Colors.white,
                      ),
                    );
                  },
                ).toList(),
              )),
            ),
          ],
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
