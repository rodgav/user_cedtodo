import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class ClearCartUseCase implements BaseUseCase<Object?, bool> {
  final HomeRepository _homeRepository;

  ClearCartUseCase(this._homeRepository);

  @override
  Future<Either<Failure, bool>> execute(Object? input) =>
      _homeRepository.clear();
}
