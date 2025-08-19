// app/views/screens/profile_edit_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myflyn/app/views/widgets/custom_button.dart';
import '../../controllers/profile_controller.dart';
import '../widgets/profile_field.dart';

class ProfileEditScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '기본정보',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: controller.updateProfile,
            child: Text(
              '저장',
              style: TextStyle(
                color: Color(0xFF6C5CE7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Avatar Section
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF6C5CE7),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          controller.currentUser?.name.substring(0, 1) ?? 'K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Handle profile picture change
                        Get.snackbar('알림', '프로필 사진 변경 기능');
                      },
                      child: Text(
                        '프로필 사진 변경',
                        style: TextStyle(color: Color(0xFF6C5CE7)),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Form Fields
              ProfileField(
                label: '아이디',
                controller: TextEditingController(
                  text: controller.editableId.value,
                ),
                onChanged: (value) => controller.editableId.value = value,
                enabled: false, // ID should not be editable
              ),

              ProfileField(
                label: '이메일',
                controller: TextEditingController(
                  text: controller.editableEmail.value,
                ),
                onChanged: (value) => controller.editableEmail.value = value,
                keyboardType: TextInputType.emailAddress,
              ),

              ProfileField(
                label: '휴대폰',
                controller: TextEditingController(
                  text: controller.editablePhone.value,
                ),
                onChanged: (value) => controller.editablePhone.value = value,
                keyboardType: TextInputType.phone,
              ),

              ProfileField(
                label: '닉네임',
                controller: TextEditingController(
                  text: controller.editableNickname.value,
                ),
                onChanged: (value) => controller.editableNickname.value = value,
              ),

              ProfileField(
                label: '인증서그룹정보',
                controller: TextEditingController(
                  text: controller.editableCertificateGroup.value,
                ),
                onChanged: (value) =>
                    controller.editableCertificateGroup.value = value,
              ),

              ProfileField(
                label: '네트워크정보',
                controller: TextEditingController(
                  text: controller.editableNetworkInfo.value,
                ),
                onChanged: (value) =>
                    controller.editableNetworkInfo.value = value,
                keyboardType: TextInputType.url,
              ),

              // Portfolio File Field
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '포트폴리오',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => Text(
                                controller.editablePortfolio.value.isEmpty
                                    ? '파일을 선택해주세요'
                                    : controller.editablePortfolio.value,
                                style: TextStyle(
                                  color:
                                      controller.editablePortfolio.value.isEmpty
                                      ? Colors.grey[500]
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: controller.selectPortfolioFile,
                            icon: Icon(
                              Icons.attach_file,
                              color: Color(0xFF6C5CE7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomButton(text: '저장하기'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
