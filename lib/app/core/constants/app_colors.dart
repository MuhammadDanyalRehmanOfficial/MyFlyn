
// app/core/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color secondary = Color(0xFF5A4FCF);
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFE74C3C);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color info = Color(0xFF3498DB);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textLight = Color(0xFFBDC3C7);
  
  // Grey Shades
  static const Color grey50 = Color(0xFFF8F9FA);
  static const Color grey100 = Color(0xFFF1F3F4);
  static const Color grey200 = Color(0xFFE8EAED);
  static const Color grey300 = Color(0xFFDADCE0);
  static const Color grey400 = Color(0xFFBDC1C6);
  static const Color grey500 = Color(0xFF9AA0A6);
  static const Color grey600 = Color(0xFF80868B);
  static const Color grey700 = Color(0xFF5F6368);
  static const Color grey800 = Color(0xFF3C4043);
  static const Color grey900 = Color(0xFF202124);
}

// app/core/constants/app_strings.dart
class AppStrings {
  // App
  static const String appName = 'MY FLYN';
  
  // Home Screen
  static const String greeting = '안녕하세요,';
  static const String homeTitle = '마이플린';
  static const String myInfo = '내 정보';
  static const String notice = '공지사항';
  static const String inquiry = '1:1문의';
  static const String faq = 'FAQ';
  static const String policy = '앱별로 정책';
  static const String dormancyPolicy = '휴면정책';
  
  // Stats
  static const String application = '신청';
  static const String certification = '인증';
  static const String achievement = '달성';
  
  // Campaign
  static const String campaignMarket = '캠페인 마켓';
  static const String search = '검색';
  static const String read = '읽기';
  static const String like = '좋아하기';
  static const String viewCategory = '카테고리보기';
  
  // Profile
  static const String profileInfo = '내정보';
  static const String basicInfo = '기본정보';
  static const String registrationInfo = '가입 정보';
  static const String passwordSettings = '비밀번호 설정';
  static const String paymentCard = '결제 카드';
  static const String save = '저장';
  static const String saveChanges = '저장하기';
  
  // Form Fields
  static const String userId = '아이디';
  static const String email = '이메일';
  static const String phone = '휴대폰';
  static const String nickname = '닉네임';
  static const String certificateGroup = '인증서그룹정보';
  static const String networkInfo = '네트워크정보';
  static const String portfolio = '포트폴리오';
  static const String currentPassword = '현재 비밀번호';
  static const String newPassword = '새 비밀번호';
  static const String confirmPassword = '새 비밀번호 확인';
  
  // Messages
  static const String comingSoon = '기능이 준비중입니다.';
  static const String profileUpdated = '프로필이 업데이트되었습니다.';
  static const String passwordUpdated = '비밀번호가 성공적으로 변경되었습니다.';
  static const String passwordMismatch = '새 비밀번호가 일치하지 않습니다.';
  static const String passwordTooShort = '비밀번호는 6자 이상이어야 합니다.';
  static const String permissionRequired = '권한 필요';
  static const String storagePermissionMessage = '파일 접근을 위해 저장소 권한이 필요합니다.';
  static const String cancel = '취소';
  static const String settings = '설정';
  static const String selectFile = '파일을 선택해주세요';
  
  // Navigation
  static const String home = '홈';
  static const String campaign = '캠페인';
  static const String myPage = '마이페이지';
}
