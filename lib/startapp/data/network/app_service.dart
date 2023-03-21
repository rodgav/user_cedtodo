import 'package:appwrite/appwrite.dart';
import 'package:dio/dio.dart';

class AppService {
  final Dio _dio;
  final Databases _databases;
  final Account _account;

  AppService(this._dio, Client client)
      : _databases = Databases(client),
        _account = Account(client);

  Future<dynamic> getSession() => _account.getSession(sessionId: 'sessionId');
}
