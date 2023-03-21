import 'package:dartz/dartz.dart';
import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/data/request/create_request.dart';
import 'package:user_cedtodo/authenticator/data/request/update_recovery_request.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';

abstract class AuthenticatorRepository {
  Future<Either<Failure, models.Session>> createEmailSession(
      CreateEmailRequest createEmailRequest);

  Future<Either<Failure, models.Token>> createRecovery(String email);

  Future<Either<Failure, models.Token>> updateRecovery(
      UpdateRecoveryRequest updateRecoveryRequest);

  Future<Either<Failure,models.Account>> create(CreateRequest createRequest);
}
