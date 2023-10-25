import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_story/api/api.dart';
import 'package:test_story/models/models.dart';
import 'package:test_story/routes/app_pages.dart';
import 'package:test_story/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  ///-------------------------------------------------------------------------------------

  final GlobalKey<FormState> verifyEmailFormKey = GlobalKey<FormState>();
  final verifyCodeController = TextEditingController();
  Timer? resendTimer;
  RxBool resendActive = false.obs;
  RxInt second = 0.obs;



  void startTimer() {
    resendActive.value = false;
    second.value=0;
    resendTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      second.value++;
      if (second.value == 45) {
        resendTimer?.cancel();
        resendActive.value = true;
      }
    });
  }


  void sendAgain() async {

    //Simulate the request to the server
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 5));
    startTimer();
    EasyLoading.dismiss();

  }



  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first'.tr);
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );
      if (res!.token.isNotEmpty) {
        startTimer();
        Get.toNamed(Routes.AUTH + Routes.VERIFYEMAIL,arguments:this);
      }else{
        CommonWidget.toast("error send data".tr);
      }


    }
  }

  void verifyEmail(BuildContext context) async {
    AppFocus.unfocus(context);
    if (verifyEmailFormKey.currentState!.validate()) {



      //Simulate the request to the server
      EasyLoading.show();
      await Future.delayed(const Duration(seconds: 5));
      EasyLoading.dismiss();

      // get token in api
      String token ="test story";
      final prefs = Get.find<SharedPreferences>();
        prefs.setString(StorageConstants.token,token);
        Get.toNamed(Routes.HOME);
    }
  }


  @override
  void onClose() {
    super.onClose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    verifyCodeController.dispose();
    resendTimer?.cancel();

  }
}
