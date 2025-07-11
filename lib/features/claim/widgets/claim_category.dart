import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/features/claim/models/claim_category_model.dart';
import 'package:setgaji/features/claim/providers/claim_category_provider.dart';

// claims category
class ClaimCategory extends StatelessWidget {
  const ClaimCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ClaimCategoryModel.categories;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: categories.length,
            itemBuilder: (context, index) => Selector<ClaimCategoryProvider, int?>(
              selector: (_, provider) => provider.selectedIndex,
              builder: (context, selectedIndex, _) => _ClaimCategoryItem(index: index, category: categories[index], isSelected: selectedIndex == index),
            ),
          ),
        );
      },
    );
  }
}

// claims category item
class _ClaimCategoryItem extends StatelessWidget {
  const _ClaimCategoryItem({required this.index, required this.category, required this.isSelected});

  final int index;
  final ClaimCategoryModel category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        context.read<ClaimCategoryProvider>().selectCategory(index);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: isSelected ? primaryColor : quaternaryColor, borderRadius: BorderRadius.circular(18)),
                    child: Icon(category.icon, color: isSelected ? Colors.white : primaryColor, size: 35),
                  ),
                  if (isSelected) const _SelectedTick(),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              category.label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: isSelected ? primaryColor : fontGrey, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// badge for selected item
class _SelectedTick extends StatelessWidget {
  const _SelectedTick();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(color: jadeGreen, shape: BoxShape.circle),
        child: Icon(HugeIcons.strokeRoundedTick02, color: fontWhite, size: 15),
      ),
    );
  }
}
