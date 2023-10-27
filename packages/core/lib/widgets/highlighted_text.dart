import 'package:core/theme/colors.dart';
import 'package:core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  const HighlightedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      color: AppColors.blueFade.withOpacity(0.12),
      child: text.body,
    );
  }
}

extension HighlightTextExtension on String {
  Widget get highlighted => HighlightedText(this);
}
