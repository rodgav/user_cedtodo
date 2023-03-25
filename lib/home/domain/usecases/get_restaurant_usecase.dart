import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetRestaurantUseCase implements BaseUseCase<String, RestaurantDataModel> {
  final HomeRepository _homeRepository;

  GetRestaurantUseCase(this._homeRepository);

  @override
  Future<Either<Failure, RestaurantDataModel>> execute(String input) =>
      _homeRepository.restaurant(input);
}
