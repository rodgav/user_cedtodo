import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:user_cedtodo/home/presentation/home/pages/restaurant/restaurant_result.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';
import 'package:user_cedtodo/startapp/presentation/results/generic_data_state.dart';

class RestaurantViewModel extends BaseViewModel
    with RestaurantViewModelInput, RestaurantViewModelOutput {
  final GetRestaurantUseCase _getRestaurantUseCase;

  RestaurantViewModel(this._getRestaurantUseCase);

  BehaviorSubject<RestaurantResult?> _restDataStreCtrl =
      BehaviorSubject<RestaurantResult?>();

  @override
  start() {
    if (_restDataStreCtrl.isClosed) {
      _restDataStreCtrl = BehaviorSubject<RestaurantResult?>();
    }
    return super.start();
  }

  @override
  finish() {
    _restDataStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<RestaurantResult?> get restDataInput => _restDataStreCtrl.sink;

  @override
  Stream<RestaurantResult?> get restDataOutput =>
      _restDataStreCtrl.stream.map((restData) => restData);

  @override
  getRestaurant(
      String restaurantId, RestaurantDataModel? restaurantDataModel) async {
    if (restaurantDataModel != null) {
      restDataInput.add(RestaurantSuccess(
          restaurantDataModel: restaurantDataModel,
          genericDataSate: GenericDataSate.data));
    } else {
      (await _getRestaurantUseCase.execute(restaurantId)).fold(
          (l) => restDataInput.add(RestaurantSuccess(
              restaurantDataModel: restaurantDataModel,
              genericDataSate: GenericDataSate.error)),
          (r) => restDataInput.add(RestaurantSuccess(
              restaurantDataModel: r, genericDataSate: GenericDataSate.data)));
    }
  }
}

abstract class RestaurantViewModelInput {
  Sink<RestaurantResult?> get restDataInput;

  getRestaurant(String restaurantId, RestaurantDataModel? restaurantDataModel);
}

abstract class RestaurantViewModelOutput {
  Stream<RestaurantResult?> get restDataOutput;
}
