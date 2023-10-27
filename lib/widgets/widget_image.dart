import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';

class WidgetImage extends StatelessWidget {
  final String src;
  final double? height, width;
  final EdgeInsets? margin, padding;
  final BorderRadius? radius;
  final BoxFit? fit;
  final Color? color;
  const WidgetImage(
    this.src, {
    super.key,
    this.height,
    this.width,
    this.radius,
    this.margin,
    this.padding,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: color ?? Theme.of(context).cardColor,
      ),
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(0),
        child: CachedNetworkImage(
          height: height,
          width: width,
          maxHeightDiskCache: 10,
          imageUrl: src,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Theme.of(context).highlightColor,
            highlightColor: Theme.of(context).hoverColor,
            child: Container(
              color: Theme.of(context).hoverColor,
              child: Assets.images.placeholders.gallery.svg(height: 24),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).highlightColor,
            child: SizedBox(
                height: 50,
                width: 50,
                child: Assets.images.placeholders.gallery.svg(height: 24)),
          ),
          fadeInDuration: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
