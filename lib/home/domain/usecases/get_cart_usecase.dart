import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetCartUseCase implements BaseUseCase<Object?, List<ProductModel>> {
  final HomeRepository _homeRepository;

  GetCartUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> execute(Object? input) =>
      _homeRepository.getCart();
}
