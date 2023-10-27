import 'package:flutter/material.dart';

class Styles {
  static const TextStyle displayLarge = TextStyle(fontSize: 32.0);
  static const TextStyle display = TextStyle(fontSize: 54.0);
  static const TextStyle displaySmall = TextStyle(fontSize: 18.0);
  static const TextStyle h1 = TextStyle(fontSize: 60.0);
  static const TextStyle h2 =
      TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold);
  static const TextStyle h3 =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  static const TextStyle h4 =
      TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold);
  static const TextStyle h5 =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  static const TextStyle h6 =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  static const TextStyle titleLarge = TextStyle(fontSize: 28.0);
  static const TextStyle title = TextStyle(fontSize: 22.0);
  static const TextStyle titleSmall = TextStyle(fontSize: 16.0);
  static const TextStyle subtitleLarge = TextStyle(fontSize: 24.0);
  static const TextStyle subtitle = TextStyle(fontSize: 20.0);
  static const TextStyle subtitleSmall = TextStyle(fontSize: 16.0);
  static const TextStyle bodyLarge = TextStyle(fontSize: 18.0);
  static const TextStyle body = TextStyle(fontSize: 16.0);
  static const TextStyle bodySmall = TextStyle(fontSize: 14.0);
  static const TextStyle captionLarge = TextStyle(fontSize: 16.0);
  static const TextStyle caption = TextStyle(fontSize: 14.0);
  static const TextStyle captionSmall = TextStyle(fontSize: 12.0);
}

extension TextStyles on String {
  Text get displayLarge => Text(this, style: Styles.displayLarge);
  Text get display => Text(this, style: Styles.display);
  Text get displaySmall => Text(this, style: Styles.displaySmall);

  Text get h1 => Text(this, style: Styles.h1);
  Text get h2 => Text(this, style: Styles.h2);
  Text get h3 => Text(this, style: Styles.h3);
  Text get h4 => Text(this, style: Styles.h4);
  Text get h5 => Text(this, style: Styles.h5);
  Text get h6 => Text(this, style: Styles.h6);

  Text get titleLarge => Text(this, style: Styles.titleLarge);
  Text get title => Text(this, style: Styles.title);
  Text get titleSmall => Text(this, style: Styles.titleSmall);

  Text get subtitleLarge => Text(this, style: Styles.subtitleLarge);
  Text get subtitle => Text(this, style: Styles.subtitle);
  Text get subtitleSmall => Text(this, style: Styles.subtitleSmall);

  Text get bodyLarge => Text(this, style: Styles.bodyLarge);
  Text get body => Text(
        this,
        style: Styles.body,
      );
  Text get bodySmall => Text(this, style: Styles.bodySmall);

  Text get captionLarge => Text(this, style: Styles.captionLarge);
  Text get caption => Text(this, style: Styles.caption);
  Text get captionSmall => Text(this, style: Styles.captionSmall);
}

extension TextStyleExtension on Text {
  Text get bold =>
      Text(data!, style: style?.copyWith(fontWeight: FontWeight.bold));
  Text get light =>
      Text(data!, style: style?.copyWith(fontWeight: FontWeight.w300));
  Text get italic =>
      Text(data!, style: style?.copyWith(fontStyle: FontStyle.italic));
  Text get underline =>
      Text(data!, style: style?.copyWith(decoration: TextDecoration.underline));
  // Text copyWith(TextStyle textStyle) =>
  //     Text(data!, style: style?.copyWith(s);
  Text strikethrough() => Text(data!,
      style: style?.copyWith(decoration: TextDecoration.lineThrough));
  Text color(Color color) => Text(data!, style: style?.copyWith(color: color));
  Text maxLines(int lines) => Text(data!, style: style, maxLines: lines);
  Text font(String font) =>
      Text(data!, style: style?.copyWith(fontFamily: font));
  Text overflow(TextOverflow overflow) =>
      Text(data!, style: style, overflow: overflow);
  Text textAlign(TextAlign align) =>
      Text(data!, style: style, textAlign: align);
  Text get uppercase => Text(data!.toUpperCase(), style: style);
  Text get smallcaps => Text(data!.toLowerCase(), style: style);
  Text get capitalizeFirstLetter =>
      Text(data![0].toUpperCase() + data!.substring(1), style: style);
  Text remove(String str) => Text(data!.replaceAll(str, ''), style: style);
  CustomText get custom => CustomText(this);
  Text textStyle(TextStyle style) {
    return Text(
      data!,
      style: this.style?.merge(style) ?? style,
    );
  }

  Text align(TextAlign alignment) => Text(
        data!,
        style: style,
        textAlign: alignment,
      );
}

class CustomText {
  final TextSpan textSpan;

  CustomText(Text text)
      : textSpan = TextSpan(text: text.data, style: text.style);

  CustomText._(this.textSpan);

  CustomText operator +(CustomText other) {
    return CustomText._(
      TextSpan(
        children: <InlineSpan>[
          ...textSpan.children ?? [textSpan],
          ...other.textSpan.children ?? [other.textSpan],
        ],
      ),
    );
  }

  Text get display => Text.rich(textSpan);
  SelectableText get selectable => SelectableText.rich(textSpan);
}
