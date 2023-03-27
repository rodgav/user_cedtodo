import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantShimmer extends StatelessWidget {
  const RestaurantShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
            leading: SizedBox(
              width: 48,
              height: 48,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
              ),
            ),
            title: Container(
                width: size.width,
                color: Colors.grey[300],
                child: const Text('test')),
            subtitle: Container(
                width: size.width,
                color: Colors.grey[300],
                child: const Text('test')),
            trailing: const Icon(Icons.keyboard_arrow_down)),
      ),
    );
  }
}
