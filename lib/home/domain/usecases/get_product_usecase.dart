import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetProductUseCase implements BaseUseCase<String, ProductDataModel> {
  final HomeRepository _homeRepository;

  GetProductUseCase(this._homeRepository);

  @override
  Future<Either<Failure, ProductDataModel>> execute(String input) =>
      _homeRepository.product(input);
}
