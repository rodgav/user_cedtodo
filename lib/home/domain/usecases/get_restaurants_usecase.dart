import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/restaurants_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetRestaurantsUseCase
    implements BaseUseCase<List<String>, RestaurantsModel> {
  final HomeRepository _homeRepository;

  GetRestaurantsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, RestaurantsModel>> execute(List<String> input) =>
      _homeRepository.restaurants(input);
}
