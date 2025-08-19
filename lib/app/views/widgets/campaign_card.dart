import 'package:flutter/material.dart';
import '../../models/campaign_model.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;
  final VoidCallback onSearch;
  final VoidCallback onRead;
  final VoidCallback onLike;
  final VoidCallback onCategory;

  const CampaignCard({
    Key? key,
    required this.campaign,
    required this.onSearch,
    required this.onRead,
    required this.onLike,
    required this.onCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF6C5CE7), width: 2),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6C5CE7).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campaign Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Campaign Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 60,
                    color: Colors.grey[200],
                    child: campaign.imageUrl.isNotEmpty
                        ? Image.network(
                            campaign.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _buildPlaceholderImage();
                            },
                          )
                        : _buildPlaceholderImage(),
                  ),
                ),

                SizedBox(width: 16),

                // Campaign Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        campaign.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),

                      // Description
                      Text(
                        campaign.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons Row
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                _buildActionButton(
                  label: '검색',
                  color: Color(0xFF6C5CE7),
                  onTap: onSearch,
                ),
                SizedBox(width: 8),
                _buildActionButton(
                  label: '읽기',
                  color: Color(0xFF6C5CE7),
                  onTap: onRead,
                ),
                SizedBox(width: 8),
                _buildActionButton(
                  label: '좋아하기',
                  color: Color(0xFF6C5CE7),
                  onTap: onLike,
                ),
                SizedBox(width: 8),
                _buildActionButton(
                  label: '카테고리보기',
                  color: Color(0xFF6C5CE7),
                  onTap: onCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(Icons.image, size: 30, color: Colors.grey[400]),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
