import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/model/categories_model.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetCategoriesUseCase implements BaseUseCase<void, CategoriesModel> {
  final HomeRepository _homeRepository;

  GetCategoriesUseCase(this._homeRepository);

  @override
  Future<Either<Failure, CategoriesModel>> execute(void input) =>
      _homeRepository.categories();
}
