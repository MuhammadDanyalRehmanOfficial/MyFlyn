// app/views/screens/campaign_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/campaign_controller.dart';
import '../widgets/campaign_card.dart';

class CampaignListScreen extends GetView<CampaignController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '캠페인 마켓',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                _buildTab('신청', true),
                SizedBox(width: 40),
                _buildTab('진행중', false),
                SizedBox(width: 40),
                _buildTab('완료', false),
              ],
            ),
          ),
          
          // Campaign List
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6C5CE7)),
                    ),
                  );
                }
                
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: controller.campaigns.length,
                  itemBuilder: (context, index) {
                    final campaign = controller.campaigns[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: CampaignCard(
                        campaign: campaign,
                        onSearch: () => controller.searchCampaign(campaign.id),
                        onRead: () => controller.readCampaign(campaign.id),
                        onLike: () => controller.toggleLike(campaign.id),
                        onCategory: () => controller.viewCategory(campaign.id),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.black : Colors.grey[500],
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 2,
          width: 20,
          color: isActive ? Color(0xFF6C5CE7) : Colors.transparent,
        ),
      ],
    );
  }
}
