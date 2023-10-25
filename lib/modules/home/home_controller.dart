import 'package:test_story/api/api.dart';
import 'package:test_story/modules/home/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;


  late MainTab mainTab;
  late DiscoverTab discoverTab;

  @override
  void onInit() async {
    super.onInit();
    mainTab = const MainTab();
    discoverTab = const DiscoverTab();
  }


  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.discover:
        return 1;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.discover;
      default:
        return MainTabs.home;
    }
  }
}
