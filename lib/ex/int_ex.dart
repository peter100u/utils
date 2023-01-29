import 'dart:math';

extension NumExtensioin on num {
// 度数转换为弧度
  deg2Rad() {
    return this * pi / 180.0;
  }
}
