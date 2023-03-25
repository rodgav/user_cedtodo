import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  final double width;
  final String textPreview;
  final int maxLines;

  const RectangleShimmer(
      {this.width = 200,
      required this.textPreview,
      this.maxLines = 1,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey[300],
            child: Text(
              textPreview,
              maxLines: maxLines,
            ),
          ),
        ));
  }
}
