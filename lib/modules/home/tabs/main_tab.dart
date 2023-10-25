import 'package:flutter/material.dart';
import 'package:test_story/modules/home/home.dart';
import 'package:get/get.dart';

class MainTab extends GetView<HomeController> {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Home'.tr);
  }



}
