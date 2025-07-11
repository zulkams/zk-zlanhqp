import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/utils/datetime_util.dart';
import 'package:setgaji/core/utils/price_util.dart';
import 'package:setgaji/features/claim/models/recent_claim_model.dart';

// recent claim
class ClaimRecent extends StatelessWidget {
  const ClaimRecent({super.key, this.recentClaim});
  final RecentClaimModel? recentClaim;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: dividerColor, width: 1),
      ),
      child: Padding(padding: EdgeInsets.all(12.0), child: _ClaimRecentContent()),
    );
  }
}

class _ClaimRecentContent extends StatelessWidget {
  const _ClaimRecentContent();

  @override
  Widget build(BuildContext context) {
    final claimWidget = context.findAncestorWidgetOfExactType<ClaimRecent>();
    final recentClaim = claimWidget?.recentClaim ?? RecentClaimModel.recentClaim;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Recent Claims',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: fontBlack),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentClaim.label,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: fontGreyDark),
                ),
                SizedBox(height: 3),
                Text(recentClaim.date.formatDate, style: TextStyle(fontSize: 14, color: fontGrey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  recentClaim.amount.formatPrice,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: fontBlack),
                ),
                SizedBox(height: 3),
                Text(
                  recentClaim.status,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: recentClaim.status.color),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
