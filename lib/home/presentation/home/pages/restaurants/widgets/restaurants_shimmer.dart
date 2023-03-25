import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantsShimmer extends StatelessWidget {
  const RestaurantsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
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
          ),
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 10),
      itemCount: 20,
    );
  }
}
