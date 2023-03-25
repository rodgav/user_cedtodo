import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircleShimmer extends StatelessWidget {
  final double width;
  final double height;

  const CircleShimmer({this.width = 100, this.height = 100, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration:
                BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
          ),
        ));
  }
}
