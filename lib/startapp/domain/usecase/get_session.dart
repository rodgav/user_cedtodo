import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/repository/repository.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetSessionUseCase implements BaseUseCase<String, dynamic> {
  final Repository _repository;

  GetSessionUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> execute(String input) =>
      _repository.getSession();
}
