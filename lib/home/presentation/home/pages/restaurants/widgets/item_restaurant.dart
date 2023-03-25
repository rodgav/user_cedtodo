import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/startapp/presentation/resources/routing/routes.dart';

class ItemRestaurant extends StatelessWidget {
  final RestaurantDataModel restaurantDataModel;

  const ItemRestaurant(this.restaurantDataModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 48,
        height: 48,
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80',
            imageBuilder: (_, imageProvider) =>
                CircleAvatar(backgroundImage: imageProvider),
            errorWidget: (_, __, ___) => const Icon(Icons.warning)),
      ),
      title: Text(restaurantDataModel.restaurantModel.name),
      subtitle: Text(restaurantDataModel.restaurantModel.category),
      onTap: () {
        context.push(
            '${AppRoutes.restaurants}/${AppRoutes.restaurant}/${restaurantDataModel.restaurantModel.restaurantId}',
            extra: restaurantDataModel);
      },
    );
  }
}
