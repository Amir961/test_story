import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home.dart';

class DiscoverTab extends GetView<HomeController> {
  const DiscoverTab({super.key});
  @override
  Widget build(BuildContext context) {
    return  Text('Discover'.tr);
  }
}
