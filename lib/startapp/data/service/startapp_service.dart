import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:dio/dio.dart';

class StartappService {
  final Dio _dio;
  final Account _account;

  StartappService(this._dio, Client client) : _account = Account(client);

  Future<models.Session> getSession() =>
      _account.getSession(sessionId: 'sessionId');
}
