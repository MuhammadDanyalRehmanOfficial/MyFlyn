// app/controllers/auth_controller.dart
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate loading user data
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    isLoading.value = true;

    // Simulate API call delay
    await Future.delayed(Duration(seconds: 2));

    // Mock user data
    currentUser.value = User(
      id: 'qed123',
      name: '홍길동',
      email: 'qed123@naver.com',
      phone: '010-1234-5678',
      nickname: '엄청난',
      certificateGroup: '1fkds_sa',
      networkInfo: 'https://www.naver.com/',
      portfolioUrl: '포트폴리오.pdf',
    );

    isLoading.value = false;

    // Navigate to home after loading
    Get.offNamed(AppRoutes.home);
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.splash);
  }
}
