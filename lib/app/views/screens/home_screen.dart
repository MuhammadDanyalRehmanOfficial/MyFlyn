
// app/views/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/stats_card.dart';
import '../widgets/menu_list_item.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '마이플린',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User Greeting Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Obx(() {
                final user = authController.currentUser.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '안녕하세요,',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '${user?.name ?? '사용자'}님',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }),
            ),
            
            // Stats Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() => StatsCard(
                      title: '신청',
                      count: controller.applicationCount.value,
                    )),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Obx(() => StatsCard(
                      title: '인증',
                      count: controller.certificationCount.value,
                    )),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Obx(() => StatsCard(
                      title: '달성',
                      count: controller.achievementCount.value,
                    )),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 8),
            
            // Menu Section
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  MenuListItem(
                    icon: Icons.person_outline,
                    title: '내 정보',
                    onTap: controller.navigateToProfile,
                  ),
                  MenuListItem(
                    icon: Icons.campaign_outlined,
                    title: '공지사항',
                    onTap: controller.navigateToNotice,
                  ),
                  MenuListItem(
                    icon: Icons.help_outline,
                    title: '1:1문의',
                    onTap: controller.navigateToInquiry,
                  ),
                  MenuListItem(
                    icon: Icons.quiz_outlined,
                    title: 'FAQ',
                    onTap: controller.navigateToFAQ,
                  ),
                  MenuListItem(
                    icon: Icons.policy_outlined,
                    title: '앱별로 정책',
                    onTap: () {},
                  ),
                  MenuListItem(
                    icon: Icons.notifications_outlined,
                    title: '공지사항',
                    onTap: controller.navigateToNotice,
                  ),
                  MenuListItem(
                    icon: Icons.bedtime,
                    title: '휴면정책',
                    onTap: () {},
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: '캠페인',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            controller.navigateToCampaigns();
          } else if (index == 2) {
            controller.navigateToProfile();
          }
        },
      ),
    );
  }
}
