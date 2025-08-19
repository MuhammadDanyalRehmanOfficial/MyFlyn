// app/routes/app_pages.dart

import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/campaign_controller.dart';
import '../controllers/profile_controller.dart';
import '../views/screens/splash_screen.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/campaign_list_screen.dart';
import '../views/screens/profile_screen.dart';
import '../views/screens/profile_edit_screen.dart';
import '../views/screens/password_settings_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(
          AuthController(),
        ); // Put instead of lazyPut for immediate availability
      }),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        // Ensure AuthController exists first
        if (!Get.isRegistered<AuthController>()) {
          Get.put(AuthController());
        }
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.campaignList,
      page: () => CampaignListScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CampaignController>(() => CampaignController());
      }),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        // Ensure AuthController exists first
        if (!Get.isRegistered<AuthController>()) {
          Get.put(AuthController());
        }
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.profileEdit,
      page: () => ProfileEditScreen(),
      binding: BindingsBuilder(() {
        // ProfileController should already exist, but ensure dependencies
        if (!Get.isRegistered<AuthController>()) {
          Get.put(AuthController());
        }
        if (!Get.isRegistered<ProfileController>()) {
          Get.lazyPut<ProfileController>(() => ProfileController());
        }
      }),
    ),
    GetPage(
      name: AppRoutes.passwordSettings,
      page: () => PasswordSettingsScreen(),
    ),
  ];
}
