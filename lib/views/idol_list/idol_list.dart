import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idoru/views/idol_list/idol_list_widgets/card.dart';
import 'package:idoru/views/idol_list/idol_list_widgets/idol_select_dialog.dart';
import 'package:idoru/widgets/pretendard_text.dart';

import '../../controllers/MyIdolController.dart';

class IdolListScreen extends StatefulWidget {
  const IdolListScreen({Key? key}) : super(key: key);

  @override
  State<IdolListScreen> createState() => _IdolListScreen();
}

class _IdolListScreen extends State<IdolListScreen> {
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
                  PText("플레이 리스트", size: 30, weight: FontWeight.bold),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        IdolSelectDialog(),
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
                    return CardWidget(id: id);
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
}
