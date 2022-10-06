import 'package:flutter/material.dart';
import 'package:get/get.dart';

ButtonStyle getStyle(int index, int selectIndex) {
  bool isSelected = index == selectIndex;
  Color? foregroundColor = isSelected ? Get.theme.colorScheme.onSecondaryContainer : null;
  Color? backgroundColor = isSelected ? Get.theme.colorScheme.secondaryContainer : null;
  return ElevatedButton.styleFrom(foregroundColor: foregroundColor, backgroundColor: backgroundColor).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
}

class UTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController? controller;

  const UTabBar({
    super.key,
    required this.tabs,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.transparent,
      unselectedLabelColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.transparent,
      tabs: tabs,
      controller: controller,
      isScrollable: true,
      indicatorWeight: 1,
      labelStyle: Get.textTheme.titleMedium,
      unselectedLabelStyle: Get.textTheme.titleMedium,
      labelPadding: const EdgeInsets.all(8),
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return states.contains(MaterialState.focused) ? null : Colors.transparent;
        },
      ),
    );
  }
}
