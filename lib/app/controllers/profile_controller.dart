
// app/controllers/profile_controller.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import '../models/user_model.dart';
import 'auth_controller.dart';

class ProfileController extends GetxController {
  // Safe way to get AuthController - will create if doesn't exist
  AuthController get _authController => Get.find<AuthController>();

  User? get currentUser => _authController.currentUser.value;

  // Reactive variables for form fields
  final RxString editableId = ''.obs;
  final RxString editableEmail = ''.obs;
  final RxString editablePhone = ''.obs;
  final RxString editableNickname = ''.obs;
  final RxString editableCertificateGroup = ''.obs;
  final RxString editableNetworkInfo = ''.obs;
  final RxString editablePortfolio = ''.obs;
  
  // Loading and validation states
  final RxBool isLoading = false.obs;
  final RxBool isFormValid = true.obs;
  final RxString errorMessage = ''.obs;

  // Form controllers for better text field management
  late TextEditingController idController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nicknameController;
  late TextEditingController certificateController;
  late TextEditingController networkController;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _initializeEditableFields();
  }

  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }

  void _initializeControllers() {
    idController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    nicknameController = TextEditingController();
    certificateController = TextEditingController();
    networkController = TextEditingController();
  }

  void _disposeControllers() {
    idController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nicknameController.dispose();
    certificateController.dispose();
    networkController.dispose();
  }

  void _initializeEditableFields() {
    if (currentUser != null) {
      editableId.value = currentUser!.id;
      editableEmail.value = currentUser!.email;
      editablePhone.value = currentUser!.phone;
      editableNickname.value = currentUser!.nickname;
      editableCertificateGroup.value = currentUser!.certificateGroup;
      editableNetworkInfo.value = currentUser!.networkInfo;
      editablePortfolio.value = currentUser!.portfolioUrl ?? '';

      // Set controllers
      idController.text = editableId.value;
      emailController.text = editableEmail.value;
      phoneController.text = editablePhone.value;
      nicknameController.text = editableNickname.value;
      certificateController.text = editableCertificateGroup.value;
      networkController.text = editableNetworkInfo.value;
    }
  }

  // Form validation
  bool _validateForm() {
    errorMessage.value = '';
    
    // Email validation
    if (!GetUtils.isEmail(editableEmail.value)) {
      errorMessage.value = '올바른 이메일 주소를 입력해주세요.';
      return false;
    }
    
    // Phone validation (Korean format)
    if (!RegExp(r'^010-\d{4}-\d{4}$').hasMatch(editablePhone.value)) {
      errorMessage.value = '휴대폰 번호는 010-0000-0000 형식으로 입력해주세요.';
      return false;
    }
    
    // Nickname validation
    if (editableNickname.value.trim().isEmpty) {
      errorMessage.value = '닉네임을 입력해주세요.';
      return false;
    }
    
    return true;
  }

  // Update profile information
  Future<void> updateProfile() async {
    if (!_validateForm()) {
      isFormValid.value = false;
      Get.snackbar(
        '입력 오류',
        errorMessage.value,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;
    isFormValid.value = true;

    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      // Update user data (in real app, this would be an API call)
      final updatedUser = User(
        id: editableId.value,
        name: currentUser!.name, // Name doesn't change in this form
        email: editableEmail.value,
        phone: editablePhone.value,
        nickname: editableNickname.value,
        certificateGroup: editableCertificateGroup.value,
        networkInfo: editableNetworkInfo.value,
        portfolioUrl: editablePortfolio.value.isEmpty ? null : editablePortfolio.value,
      );

      // Update the user in auth controller
      _authController.currentUser.value = updatedUser;

      Get.snackbar(
        '성공',
        '프로필이 성공적으로 업데이트되었습니다.',
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
        snackPosition: SnackPosition.TOP,
      );

      Get.back(); // Return to profile screen

    } catch (e) {
      Get.snackbar(
        '오류',
        '프로필 업데이트 중 오류가 발생했습니다.',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Handle file upload
  Future<void> selectPortfolioFile() async {
    try {
      // Request storage permission
      final permission = await Permission.storage.request();
      
      if (permission == PermissionStatus.granted) {
        await _pickFile();
      } else if (permission == PermissionStatus.permanentlyDenied) {
        _showPermissionDialog();
      } else {
        Get.snackbar(
          '권한 거부',
          '파일 선택을 위해 저장소 권한이 필요합니다.',
          backgroundColor: Colors.orange.withOpacity(0.1),
          colorText: Colors.orange,
        );
      }
    } catch (e) {
      Get.snackbar(
        '오류',
        '파일 선택 중 오류가 발생했습니다.',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final fileName = result.files.first.name;
        editablePortfolio.value = fileName;
        
        Get.snackbar(
          '파일 선택 완료',
          '$fileName 파일이 선택되었습니다.',
          backgroundColor: Colors.blue.withOpacity(0.1),
          colorText: Colors.blue,
        );
      }
    } catch (e) {
      Get.snackbar(
        '오류',
        '파일 선택 중 오류가 발생했습니다.',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  void _showPermissionDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('저장소 권한 필요'),
        content: Text('파일 업로드를 위해 저장소 접근 권한이 필요합니다.\n설정에서 권한을 허용해주세요.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              '취소',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Get.back();
            },
            child: Text(
              '설정',
              style: TextStyle(color: Color(0xFF6C5CE7)),
            ),
          ),
        ],
      ),
    );
  }

  // Format phone number as user types
  void formatPhoneNumber(String value) {
    String numbers = value.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (numbers.length <= 3) {
      editablePhone.value = numbers;
    } else if (numbers.length <= 7) {
      editablePhone.value = '${numbers.substring(0, 3)}-${numbers.substring(3)}';
    } else if (numbers.length <= 11) {
      editablePhone.value = '${numbers.substring(0, 3)}-${numbers.substring(3, 7)}-${numbers.substring(7)}';
    }
    
    phoneController.text = editablePhone.value;
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
  }
}