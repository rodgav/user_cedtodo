import 'package:user_cedtodo/home/domain/model/base_model.dart';

class RestaurantsModel extends BaseTotalModel {
  final List<RestaurantDataModel> restaurantsDataModel;

  RestaurantsModel({required this.restaurantsDataModel, required int total})
      : super(total: total);
}

class RestaurantDataModel extends BaseIdsModel {
  final RestaurantModel restaurantModel;

  RestaurantDataModel(
      {required this.restaurantModel,
      required String collectionId,
      required String databaseId,
      required DateTime createdAt,
      required DateTime updatedAt})
      : super(
            collectionId: collectionId,
            databaseId: databaseId,
            createdAt: createdAt,
            updatedAt: updatedAt);
}

class RestaurantModel {
  final String restaurantId;
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;
  final String category;
  final List<String> menu;
  final String image;

  RestaurantModel(
      {required this.restaurantId,
      required this.userId,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.category,
      required this.menu,
      required this.image});
}
