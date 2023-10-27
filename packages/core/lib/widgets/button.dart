import 'package:core/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, small, text, smallText }

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final EdgeInsets? margin, padding;
  final double? height, width;
  final ButtonType? type;
  final Color? bgColor, textColor, shadowColor, loadingColor;
  final LinearGradient? gradient;
  final bool? disabled, loading;
  final Widget? prefix, suffix, loadingWidget;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final VoidCallback? onTapCancel;
  final void Function(bool)? onHighlightChanged;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final TextStyle? textstyle;
  final FocusNode? focusNode;
  final void Function(bool)? onFocusChange;
  final MaterialStatesController? statesController;
  const Button(
    this.title, {
    super.key,
    required this.onPressed,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.type,
    this.bgColor,
    this.textColor,
    this.shadowColor,
    this.loadingColor,
    this.gradient,
    this.disabled,
    this.loading,
    this.prefix,
    this.suffix,
    this.textstyle,
    this.loadingWidget,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.focusNode,
    this.statesController,
    this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    bool isOutlined = type == ButtonType.outlined ? true : false;
    BoxDecoration outlined = BoxDecoration(
      border: Border.all(
          color: disabled ?? false
              ? AppColors.caption
              : bgColor ?? AppColors.secondary),
      borderRadius: borderRadius ?? BorderRadius.circular(5),
    );
    TextStyle style = textstyle ?? const TextStyle();
    return Container(
      margin: margin,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5)),
        type: MaterialType.button,
        color: isOutlined ||
                type == ButtonType.text ||
                type == ButtonType.smallText
            ? Colors.transparent
            : disabled ?? false
                ? AppColors.caption
                : bgColor ?? AppColors.secondary,
        child: InkWell(
          // Functions
          onTap: disabled ?? false ? () {} : onPressed,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress ?? () {},
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onTapCancel: onTapCancel,
          onHighlightChanged: onHighlightChanged,
          onHover: onHover,
          mouseCursor: mouseCursor,
          // Decoration
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: disabled ?? false
              ? AppColors.caption
              : highlightColor ?? bgColor ?? AppColors.secondary,
          overlayColor: overlayColor,
          splashColor: disabled ?? false
              ? AppColors.caption
              : splashColor ?? AppColors.mediumBlue,
          splashFactory: splashFactory,
          radius: radius,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          customBorder: customBorder,
          focusNode: focusNode,
          statesController: statesController,
          onFocusChange: onFocusChange,
          // Inner
          child: type == ButtonType.text
              ? title.body.capitalizeFirstLetter
                  .color(textColor ?? AppColors.dark)
                  .textStyle(style)
              : type == ButtonType.smallText
                  ? title.caption.capitalizeFirstLetter
                      .color(textColor ?? AppColors.dark)
                  : Container(
                      width: width,
                      height: height ?? 50,
                      padding:
                          padding ?? const EdgeInsets.symmetric(horizontal: 20),
                      decoration: (isOutlined ? outlined : null),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prefix ?? const SizedBox(),
                          SizedBox(width: prefix == null ? 0 : 5),
                          title.body.capitalizeFirstLetter
                              .color(textColor ??
                                  (isOutlined
                                      ? disabled ?? false
                                          ? AppColors.caption
                                          : bgColor ?? AppColors.secondary
                                      : Neurtral.white))
                              .bold
                              .textStyle(style),
                          SizedBox(width: suffix == null ? 0 : 5),
                          suffix ?? const SizedBox(),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
