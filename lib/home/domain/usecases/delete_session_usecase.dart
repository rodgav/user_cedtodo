import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class DeleteSessionUseCase implements BaseUseCase<Object?, dynamic> {
  final HomeRepository _homeRepository;

  DeleteSessionUseCase(this._homeRepository);

  @override
  Future<Either<Failure, dynamic>> execute(Object? input) =>
      _homeRepository.deleteSession();
}
