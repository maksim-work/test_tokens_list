import 'dart:math';
import 'dart:ui';

class ColorManager {
  ColorManager._();

  static final Random _random = Random();

  static Color getRandomRGBColor() {
    return Color.fromARGB(
      255,
      128 + _random.nextInt(128),
      128 + _random.nextInt(128),
      128 + _random.nextInt(128),
    );
  }
}
