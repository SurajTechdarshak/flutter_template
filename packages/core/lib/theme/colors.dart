import 'package:flutter/material.dart';

class Neurtral {
  static const Color black = Color(0xff212121);
  static const Color darkGrey = Color(0xff4d4d4d);
  static const Color grey = Color(0xff717171);
  static const Color lightGrey = Color(0xff89939e);
  static const Color greyBlue = Color(0xffABBED1);
  static const Color silver = Color(0xffF5F7FA);
  static const Color white = Color(0xffFFFFFF);
}

class AppColors {
  static const Color primary = Color(0xffFFDD00);
  static const Color secondary = Color(0xff7024C4);
  static const Color secondaryDark = Color(0xff3B096D);
  static const Color mediumBlue = Color(0xff0671E0);
  static const Color azure = Color(0xff4196F0);
  static const Color sky = Color(0xffDBEDFF);
  static const Color lightBlue = Color(0xffEEF5FC);
  static const Color dark = Color(0xff222222);
  static const Color fade = Color(0xffFFEAE8);
  static const Color light = Color(0xffF5F5F5);
  static const Color light2 = Color(0xffE7EAEE);
  static const Color blue = Color(0xff1D4ED8);
  static const Color blueFade = Color(0xff8EA7EC);
  static const Color caption = Color(0xffB6B6B6);
}

class Success {
  static const Color darkGreen = Color(0xff115B43);
  static const Color forest = Color(0xff1B6E53);
  static const Color mediumGreen = Color(0xff009262);
  static const Color herbal = Color(0xff32C997);
  static const Color mint = Color(0xff84DFC1);
  static const Color lightGreen = Color(0xffF1FBF8);
}

class Warning {
  static const Color darkYellow = Color(0xffE48900);
  static const Color lemon = Color(0xffFFA826);
  static const Color mediumYellow = Color(0xffFFB240);
  static const Color straw = Color(0xffFFC670);
  static const Color sand = Color(0xffFFD596);
  static const Color lightYellow = Color(0xffFFF8EC);
}

class Alert {
  static const Color darkRed = Color(0xffC33025);
  static const Color scarlet = Color(0xffE01507);
  static const Color mediumRed = Color(0xffE02B1D);
  static const Color raspberry = Color(0xffFF5A4F);
  static const Color rubicund = Color(0xffF0857D);
  static const Color lightRed = Color(0xffFFF1F0);
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0')}';
}

Color addOpacity(Color color, double opacity) {
  return color.withOpacity(opacity);
}

extension ColorExtension on Color {
  MaterialColor get material => getMaterialColor(this);
  MaterialStateProperty<Color> get materialStatePropertyColor =>
      MaterialStatePropertyAll<Color>(this);
  String get hex => colorToHex(this);
  Color opacity(double opacity) => addOpacity(this, opacity);
}

extension HexColorExtension on String {
  Color get color {
    final hexColor = replaceAll("#", "");
    return Color(int.parse('FF$hexColor', radix: 16));
  }
}

extension GradientExtension on List<Color> {
  LinearGradient get gradient {
    return LinearGradient(colors: this);
  }
}

extension LinearGradientExtension on LinearGradient {
  LinearGradient get topToBottom {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get bottomToTop {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get leftToRight {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get rightToLeft {
    return LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get topLeftToBottomRight {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get topRightToBottomLeft {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get bottomLeftToTopRight {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: colors,
      stops: stops,
    );
  }

  LinearGradient get bottomRightToTopLeft {
    return LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: colors,
      stops: stops,
    );
  }
}
