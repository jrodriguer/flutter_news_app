import 'dart:ui';

class Helpers {
  static hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(
      int.parse(
        hexString.replaceFirst('#', '0x$alphaChannel'),
      ),
    );
  }
}
