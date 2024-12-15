import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // Observable for the selected index

  void changePage(int index) {
    currentIndex.value = index;
  }
}
