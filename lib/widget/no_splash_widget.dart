import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoSplashWidget extends StatelessWidget {
  final Widget child;

  const NoSplashWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(data: Get.theme.copyWith(splashFactory: NoSplash.splashFactory), child: child);
  }
}
