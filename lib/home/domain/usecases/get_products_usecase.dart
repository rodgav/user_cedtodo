import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/products_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetProductsUseCase implements BaseUseCase<List<String>, ProductsModel> {
  final HomeRepository _homeRepository;

  GetProductsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, ProductsModel>> execute(List<String> input) =>
      _homeRepository.products(input);
}
