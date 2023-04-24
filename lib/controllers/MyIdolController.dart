import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class MyIdolController extends GetxController {
  var myIdolIdList = [].obs;
  var currentPage = 0.obs;
  var carouselController = CarouselController().obs;

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
