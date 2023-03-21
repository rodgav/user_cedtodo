import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:dio/dio.dart';
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/data/request/create_request.dart';
import 'package:user_cedtodo/authenticator/data/request/update_recovery_request.dart';

class AuthenticatorService {
  final Dio _dio;
  final Account _account;

  AuthenticatorService(this._dio, Client client) : _account = Account(client);

  Future<models.Session> createEmailSession(
          CreateEmailRequest createEmailRequest) =>
      _account.createEmailSession(
          email: createEmailRequest.email,
          password: createEmailRequest.password);

  Future<models.Token> createRecovery(String email) =>
      _account.createRecovery(email: email, url: 'urlForDeepLink');

  Future<models.Token> updateRecovery(
          UpdateRecoveryRequest updateRecoveryRequest) =>
      _account.updateRecovery(
          userId: updateRecoveryRequest.userId,
          secret: updateRecoveryRequest.secret,
          password: updateRecoveryRequest.password,
          passwordAgain: updateRecoveryRequest.passwordAgain);

  Future<models.Account> create(CreateRequest createRequest) => _account.create(
      userId: 'unique()',
      email: createRequest.email,
      password: createRequest.password);
}
