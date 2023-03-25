import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';

abstract class RestaurantsResult {}

class RestaurantsSuccess extends RestaurantsResult {
  final RestaurantsModel? restaurantsModel;
  final RestaurantsDataLoads restaurantsDataLoads;

  RestaurantsSuccess(
      {required this.restaurantsModel, required this.restaurantsDataLoads});
}

enum RestaurantsDataLoads { loadData, data, noData ,error}
