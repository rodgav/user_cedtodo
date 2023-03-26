import 'package:appwrite/models.dart' as models;
import 'package:user_cedtodo/startapp/data/service/startapp_hive_service.dart';

abstract class StartAppLocalDataSource {
  Future<models.Session?> getSession();

  putSession(models.Session session);
}

class StartAppLocalDataSourceImpl implements StartAppLocalDataSource {
  final StartAppHiveService _startAppHiveService;

  StartAppLocalDataSourceImpl(this._startAppHiveService);

  @override
  Future<models.Session?> getSession() => _startAppHiveService.getSession();

  @override
  putSession(models.Session session) =>
      _startAppHiveService.putSession(session);
}
