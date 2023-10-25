import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_story/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book,
            color: ColorConstants.darkGray,
            size: 30.0,
          ),
            Text(
            'Test User story...'.tr,
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
