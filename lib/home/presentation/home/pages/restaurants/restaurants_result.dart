import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

abstract class RestaurantsResult {}

class RestaurantsSuccess extends RestaurantsResult {
  final RestaurantsModel? restaurantsModel;
  final GenericDataSate genericDataState;

  RestaurantsSuccess(
      {required this.restaurantsModel, required this.genericDataState});
}


