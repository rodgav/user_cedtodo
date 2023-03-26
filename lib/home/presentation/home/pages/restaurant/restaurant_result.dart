import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

abstract class RestaurantResult {}

class RestaurantSuccess extends RestaurantResult {
  final RestaurantDataModel? restaurantDataModel;
  final GenericDataSate genericDataSate;

  RestaurantSuccess({required this.restaurantDataModel,required this.genericDataSate});
}
