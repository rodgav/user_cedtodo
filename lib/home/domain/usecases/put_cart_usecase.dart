import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class PutCartUseCase implements BaseUseCase<ProductModel, ProductModel> {
  final HomeRepository _homeRepository;

  PutCartUseCase(this._homeRepository);

  @override
  Future<Either<Failure, ProductModel>> execute(ProductModel input) =>
      _homeRepository.putCart(input);
}
