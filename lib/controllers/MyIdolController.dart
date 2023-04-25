import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class MyIdolController extends GetxController {
  var myIdolIdList = [].obs;
  var currentPage = 0.obs;
  var carouselController = CarouselController().obs;
  var idolData = {
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
  }.obs;

  void loadMyIdolList(String csv) {
    if (csv == "") {
      myIdolIdList.value = [];
      return;
    }
    myIdolIdList.value = csv.split(',').map((e) => int.parse(e)).toList();
  }

  void addIdol(int id) {
    myIdolIdList.add(id);
  }

  void removeIdol(int id) {
    myIdolIdList.remove(id);
  }

  bool isMyIdol(int id) {
    return myIdolIdList.contains(id);
  }

  int getMyIdolCount() {
    return myIdolIdList.length;
  }

  void setCurrentPage(int page) {
    currentPage.value = page;
  }
}
