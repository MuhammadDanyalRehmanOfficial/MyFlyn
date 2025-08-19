// app/controllers/campaign_controller.dart - Enhanced
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/campaign_model.dart';

class CampaignController extends GetxController {
  final RxList<Campaign> campaigns = <Campaign>[].obs;
  final RxBool isLoading = false.obs;
  final RxString selectedTab = '신청'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadCampaigns();
  }

  Future<void> _loadCampaigns() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(Duration(milliseconds: 800));
    
    // Mock campaign data matching Figma
    campaigns.value = [
      Campaign(
        id: '1',
        title: '휴가때 나누는 여기',
        description: '근무시간 나누는 휴가보상과 힐링이 가능한 나들이',
        imageUrl: 'https://picsum.photos/200/150?random=1',
        tags: ['휴가', '힐링', '나들이', '나데로여행지'],
      ),
      Campaign(
        id: '2',
        title: '휴가때 나누는 여기',
        description: '근무시간 나누는 휴가보상과 힐링이 가능한 나들이',
        imageUrl: 'https://picsum.photos/200/150?random=2',
        tags: ['휴가', '힐링', '나들이', '나데로여행지'],
      ),
      Campaign(
        id: '3',
        title: '휴가때 나누는 여기',
        description: '근무시간 나누는 휴가보상과 힐링이 가능한 나들이',
        imageUrl: 'https://picsum.photos/200/150?random=3',
        tags: ['휴가', '힐링', '나들이', '나데로여행지'],
      ),
      Campaign(
        id: '4',
        title: '휴가때 나누는 여기',
        description: '근무시간 나누는 휴가보상과 힐링이 가능한 나들이',
        imageUrl: 'https://picsum.photos/200/150?random=4',
        tags: ['휴가', '힐링', '나들이', '나데로여행지'],
      ),
      Campaign(
        id: '5',
        title: '휴가때 나누는 여기',
        description: '근무시간 나누는 휴가보상과 힐링이 가능한 나들이',
        imageUrl: 'https://picsum.photos/200/150?random=5',
        tags: ['휴가', '힐링', '나들이', '나데로여행지'],
      ),
    ];
    
    isLoading.value = false;
  }

  void switchTab(String tab) {
    selectedTab.value = tab;
    // In a real app, you would filter campaigns based on tab
    _loadCampaigns();
  }

  void searchCampaign(String campaignId) {
    Get.snackbar(
      '검색',
      '캠페인 검색 기능이 실행되었습니다.',
      backgroundColor: Colors.blue.withOpacity(0.1),
      colorText: Colors.blue,
      snackPosition: SnackPosition.TOP,
    );
  }

  void readCampaign(String campaignId) {
    Get.snackbar(
      '읽기',
      '캠페인 상세보기로 이동합니다.',
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
  }

  void toggleLike(String campaignId) {
    final index = campaigns.indexWhere((c) => c.id == campaignId);
    if (index != -1) {
      Get.snackbar(
        '좋아하기',
        '캠페인을 좋아요 했습니다!',
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void viewCategory(String campaignId) {
    Get.snackbar(
      '카테고리',
      '카테고리별 캠페인을 확인합니다.',
      backgroundColor: Color(0xFF6C5CE7).withOpacity(0.1),
      colorText: Color(0xFF6C5CE7),
      snackPosition: SnackPosition.TOP,
    );
  }

  void refreshCampaigns() {
    _loadCampaigns();
  }
}