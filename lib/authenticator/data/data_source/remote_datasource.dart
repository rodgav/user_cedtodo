import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/data/request/create_request.dart';
import 'package:user_cedtodo/authenticator/data/request/update_recovery_request.dart';
import 'package:user_cedtodo/authenticator/data/service/authenticator_service.dart';

abstract class AuthenticatorRemoteDataSource {
  Future<models.Session> createEmailSession(
      CreateEmailRequest createEmailRequest);

  Future<models.Token> createRecovery(String email);

  Future<models.Token> updateRecovery(
      UpdateRecoveryRequest updateRecoveryRequest);

  Future<models.Account> create(CreateRequest createRequest);
}

class AuthenticatorRemoteDataSourceImpl
    implements AuthenticatorRemoteDataSource {
  final AuthenticatorService _authenticatorService;

  AuthenticatorRemoteDataSourceImpl(this._authenticatorService);

  @override
  Future<models.Account> create(CreateRequest createRequest) =>
      _authenticatorService.create(createRequest);

  @override
  Future<models.Session> createEmailSession(
          CreateEmailRequest createEmailRequest) =>
      _authenticatorService.createEmailSession(createEmailRequest);

  @override
  Future<models.Token> createRecovery(String email) =>
      _authenticatorService.createRecovery(email);

  @override
  Future<models.Token> updateRecovery(
          UpdateRecoveryRequest updateRecoveryRequest) =>
      _authenticatorService.updateRecovery(updateRecoveryRequest);
}
