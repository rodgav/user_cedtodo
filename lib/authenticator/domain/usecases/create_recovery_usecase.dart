import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class CreateRecoveryUseCase implements BaseUseCase<String, models.Token> {
  final AuthenticatorRepository _authenticatorRepository;

  CreateRecoveryUseCase(this._authenticatorRepository);

  @override
  Future<Either<Failure, models.Token>> execute(String input) =>
      _authenticatorRepository.createRecovery(input);
}
