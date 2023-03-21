import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({Key? key}) : super(key: key);

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('restaurants'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.push('${AppRoutes.restaurants}/${AppRoutes.restaurant}/1');
              },
              child: const Text('restaurant')),
          ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.splash);
              },
              child: const Text('splash'))
        ],
      ),
    );
  }
}
