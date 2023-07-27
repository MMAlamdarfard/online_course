// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Controller extends GetxController {
  var index = 0.obs;
  setIndex(int value) => index.value = value;
  int getIndex() => index.value;

  var viewPageIndex = 0.obs;
  setviewPageIndex(int value) => viewPageIndex.value = value;
  int getviewPageIndex() => viewPageIndex.value;

  var showMoreText = false.obs;
  setshowMoreText(bool value) => showMoreText.value = value;
  reverseShowMoreText() => showMoreText.value = !showMoreText.value;
  bool getshowMoreText() => showMoreText.value;

  var isPlayingVideoFromDetailPage = false.obs;
  setIsPlayingVideoFromDetailPage(bool value) => isPlayingVideoFromDetailPage.value = value;
  reverseIsPlayingVideoFromDetailPage() => isPlayingVideoFromDetailPage.value = !isPlayingVideoFromDetailPage.value;
  bool getIsPlayingVideoFromDetailPage() => isPlayingVideoFromDetailPage.value;

 

}
