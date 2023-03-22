import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/authenticator/data/request/update_recovery_request.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class UpdateRecoveryUseCase
    implements BaseUseCase<UpdateRecoveryRequest, models.Token> {
  final AuthenticatorRepository _authenticatorRepository;

  UpdateRecoveryUseCase(this._authenticatorRepository);

  @override
  Future<Either<Failure, models.Token>> execute(UpdateRecoveryRequest input) =>
      _authenticatorRepository.updateRecovery(input);
}
