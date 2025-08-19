
// app/controllers/home_controller.dart
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final RxInt applicationCount = 0.obs;
  final RxInt certificationCount = 0.obs;
  final RxInt achievementCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadStats();
  }

  Future<void> _loadStats() async {
    // Simulate loading stats
    await Future.delayed(Duration(milliseconds: 500));
    applicationCount.value = 5;
    certificationCount.value = 3;
    achievementCount.value = 2;
  }

  void navigateToProfile() {
    Get.toNamed(AppRoutes.profile);
  }

  void navigateToCampaigns() {
    Get.toNamed(AppRoutes.campaignList);
  }

  void navigateToNotice() {
    // Implement notice navigation
    Get.snackbar('알림', '공지사항 기능이 준비중입니다.');
  }

  void navigateToInquiry() {
    // Implement inquiry navigation
    Get.snackbar('알림', '1:1 문의 기능이 준비중입니다.');
  }

  void navigateToFAQ() {
    // Implement FAQ navigation
    Get.snackbar('알림', 'FAQ 기능이 준비중입니다.');
  }
}