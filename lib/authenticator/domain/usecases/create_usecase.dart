import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/authenticator/data/request/create_request.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class CreateUseCase implements BaseUseCase<CreateRequest, models.Account> {
  final AuthenticatorRepository _authenticatorRepository;

  CreateUseCase(this._authenticatorRepository);

  @override
  Future<Either<Failure, models.Account>> execute(CreateRequest input) =>
      _authenticatorRepository.create(input);
}
