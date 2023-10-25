import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'fa_IR.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'fa_IR': fa_IR,
      };
}
