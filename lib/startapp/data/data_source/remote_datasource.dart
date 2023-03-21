import 'package:user_cedtodo/startapp/data/network/app_service.dart';

abstract class RemoteDataSource {
  Future<dynamic> getSession();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppService _appService;

  RemoteDataSourceImpl(this._appService);

  @override
  Future<dynamic> getSession() => _appService.getSession();
}
