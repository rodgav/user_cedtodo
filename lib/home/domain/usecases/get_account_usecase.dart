import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetAccountUseCase implements BaseUseCase<Object?, models.Account> {
  final HomeRepository _homeRepository;

  GetAccountUseCase(this._homeRepository);

  @override
  Future<Either<Failure, models.Account>> execute(Object? input) =>
      _homeRepository.getAccount();
}
