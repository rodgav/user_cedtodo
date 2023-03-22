import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class CreateEmailSessionUseCase
    implements BaseUseCase<CreateEmailRequest, models.Session> {
  final AuthenticatorRepository _authenticatorRepository;

  CreateEmailSessionUseCase(this._authenticatorRepository);

  @override
  Future<Either<Failure, models.Session>> execute(CreateEmailRequest input) =>
      _authenticatorRepository.createEmailSession(input);
}
