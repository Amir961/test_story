import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_story/modules/auth/auth.dart';
import 'package:test_story/shared/shared.dart';

class VerifyEmailScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: CommonWidget.appBar(
        context,
        'Verify Email'.tr,
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
      key: controller.verifyEmailFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 5,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.disabled,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              autoDisposeControllers: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Code is required'.tr;
                } else if (value.length != 5) {
                  return 'Code should be 5 characters'.tr;
                }
                return null;
              },
              controller: controller.verifyCodeController,
              onCompleted: (v) {
                controller.verifyEmail(context);
              },

            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: 'Verify'.tr,
              onPressed: () {
                controller.verifyEmail(context);
              },
            ),
            CommonWidget.rowHeight(),

            // Obx(() =>
            //     Center(
            //
            //       child: textSpanWithAction('Did not receive code'.tr, "Resend".tr.toUpperCase(), () {
            //         if (resendActive.value) {
            //           _controller.sendSMS(widget.registrationId, true);
            //           startTimer();
            //         }
            //       }, textAlign: TextAlign.end, subColor: resendActive.value ? null : context.theme.dividerColor),
            //     ))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Don't receive code".tr),
                GestureDetector(
                    onTap: () {
                      if (controller.resendActive.value) {
                        controller.sendAgain();
                      }
                    },
                    child: Obx(()=> Text("Resend".tr,style: TextStyle(color:controller.resendActive.value ? Colors.black : Colors.grey ),)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
