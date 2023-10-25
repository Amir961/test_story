import 'package:test_story/modules/auth/auth.dart';
import 'package:test_story/modules/auth/verify_email_screen.dart';
import 'package:test_story/modules/home/home.dart';
import 'package:test_story/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.VERIFYEMAIL, page: () => VerifyEmailScreen()),
      ],
    ),
    GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
       ),
  ];
}
