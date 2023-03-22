import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/repository/startapp_repository.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetSessionUseCase implements BaseUseCase<void, dynamic> {
  final StartappRepository _startappRepository;

  GetSessionUseCase(this._startappRepository);

  @override
  Future<Either<Failure, models.Session>> execute(void input) =>
      _startappRepository.getSession();
}
