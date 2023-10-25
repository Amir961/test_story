import 'package:flutter/material.dart';
import 'package:test_story/modules/auth/auth.dart';
import 'package:test_story/shared/shared.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final AuthController controller = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:hexToColor('#405FA3'),
      appBar: CommonWidget.appBar(
        context,
        'Sign Up'.tr,
        Icons.arrow_back,
        Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: _buildForms(context),
      ),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.registerEmailController,
              keyboardType: TextInputType.text,
              labelText: 'Email address'.tr,
              placeholder: 'Enter Email Address'.tr,
              validator: (value) {
                if (!Regex.isEmail(value!)) { // or GetUtils.isEmail
                  return 'Email format error'.tr;
                }

                if (value.isEmpty) {
                  return 'Email is required'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.registerPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Password'.tr,
              placeholder: 'Enter Password'.tr,
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required'.tr;
                }

                if (value.length < 6 || value.length > 15) {
                  return 'Password should be 6~15 characters'.tr;
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.registerConfirmPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Confirm Password'.tr,
              placeholder: 'Enter Password'.tr,
              password: true,
              validator: (value) {
                if (controller.registerPasswordController.text !=
                    controller.registerConfirmPasswordController.text) {
                  return 'Confirm Password is not consistence with Password'.tr;
                }

                if (value!.isEmpty) {
                  return 'Confirm Password is required'.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(height: 10.0),
            AppCheckbox(
              label: 'I have read and agreed'.tr,
              checked: controller.registerTermsChecked,
              onChecked: (val) {
                controller.registerTermsChecked = val!;
              },
            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: 'Sign Up'.tr,
              backgroundColor: Colors.white,
              onPressed: () {
                controller.register(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
