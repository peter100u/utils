import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static OverlayEntry? _overlayEntry; // toast靠它加到屏幕上
  static bool _showing = false; // toast是否正在showing
  static late DateTime _startedTime; // 开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static late String _msg; // 提示内容
  static late int _showTime; // toast显示时间
  static late String _toastPosition; // 显示位置
  static void show({
    required String msg,
    int showTime = 2000,
    String position = 'center',
  }) async {
    _msg = msg;
    _startedTime = DateTime.now();
    _showTime = showTime;
    _toastPosition = position;
    //获取OverlayState
    OverlayState overlayState = Overlay.of(Get.overlayContext!);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
          builder: (_) => Positioned(
                //top值，可以改变这个值来改变toast在屏幕中的位置
                top: _calToastPosition(),
                child: Container(
                    alignment: Alignment.center,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: AnimatedOpacity(
                        opacity: _showing ? 1.0 : 0.0, //目标透明度
                        duration: _showing ? const Duration(milliseconds: 100) : const Duration(milliseconds: 400),
                        child: _buildToastWidget(),
                      ),
                    )),
              ));
      overlayState.insert(_overlayEntry!);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry?.markNeedsBuild();
    }
    await Future.delayed(Duration(milliseconds: _showTime)); // 等待时间

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= _showTime) {
      _showing = false;
      _overlayEntry?.markNeedsBuild();
      await Future.delayed(const Duration(milliseconds: 400));
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Center(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Get.theme.colorScheme.primaryContainer),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            _msg,
            style: Get.textTheme.titleSmall?.copyWith(color: Get.theme.colorScheme.onPrimaryContainer),
          ),
        ),
      ),
    );
  }

//  设置toast位置
  static _calToastPosition() {
    double backResult;
    if (_toastPosition == 'top') {
      backResult = Get.height * 1 / 4;
    } else if (_toastPosition == 'center') {
      backResult = Get.height * 2 / 5;
    } else {
      backResult = Get.height * 3 / 4;
    }
    return backResult;
  }
}
