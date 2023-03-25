import 'package:rxdart/rxdart.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:user_cedtodo/startapp/presentation/base/base_viewmodel.dart';

class RestaurantViewModel extends BaseViewModel
    with RestaurantViewModelInput, RestaurantViewModelOutput {
  final GetRestaurantUseCase _getRestaurantUseCase;

  RestaurantViewModel(this._getRestaurantUseCase);

  BehaviorSubject<RestaurantDataModel?> _restDataStreCtrl =
      BehaviorSubject<RestaurantDataModel?>();

  @override
  start() {
    if (_restDataStreCtrl.isClosed) {
      _restDataStreCtrl = BehaviorSubject<RestaurantDataModel?>();
    }
    return super.start();
  }

  @override
  finish() {
    _restDataStreCtrl.close();
    return super.finish();
  }

  @override
  Sink<RestaurantDataModel?> get restDataInput => _restDataStreCtrl.sink;

  @override
  Stream<RestaurantDataModel?> get restDataOutput =>
      _restDataStreCtrl.stream.map((restData) => restData);

  @override
  getRestaurant(
      String restaurantId, RestaurantDataModel? restaurantDataModel) async {
    if (restaurantDataModel != null) {
      restDataInput.add(restaurantDataModel);
    } else {
      (await _getRestaurantUseCase.execute(restaurantId))
          .fold((l) => restDataInput.add(null), (r) => restDataInput.add(r));
    }
  }
}

abstract class RestaurantViewModelInput {
  Sink<RestaurantDataModel?> get restDataInput;

  getRestaurant(String restaurantId, RestaurantDataModel? restaurantDataModel);
}

abstract class RestaurantViewModelOutput {
  Stream<RestaurantDataModel?> get restDataOutput;
}
