import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_viewmodel.dart';
import 'package:user_cedtodo/main.dart';
import 'package:user_cedtodo/startapp/presentation/resources/dialogs/dialogs.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/route.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class RestaurantView extends StatefulWidget {
  final String? restaurantId;
  final RestaurantDataModel? restaurantDataModel;

  const RestaurantView(
      {required this.restaurantId, required this.restaurantDataModel, Key? key})
      : super(key: key);

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView> {
  final _restaurantViewModel = getIt<RestaurantViewModel>();

  _bind() {
    _restaurantViewModel.start();
    if (widget.restaurantId != null) {
      _restaurantViewModel.getRestaurant(
          widget.restaurantId!, widget.restaurantDataModel);
    } else {
      showDialogMessage(context,
          title: 'Ocurrio un error',
          message: 'No se proporciono un restaurante',
          rightText: 'Cerrar',
          rightOnPressed: () => context.back());
    }
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _restaurantViewModel.finish();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('restaurant ${widget.restaurantId}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.cart);
              },
              child: const Text('cart'))
        ],
      ),
    );
  }
}
