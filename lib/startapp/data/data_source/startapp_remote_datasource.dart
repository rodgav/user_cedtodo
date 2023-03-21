import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/startapp/data/service/startapp_service.dart';

abstract class StartappRemoteDataSource {
  Future<models.Session> getSession();
}

class StartappRemoteDataSourceImpl implements StartappRemoteDataSource {
  final StartappService _appService;

  StartappRemoteDataSourceImpl(this._appService);

  @override
  Future<models.Session> getSession() => _appService.getSession();
}
