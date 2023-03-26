import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_local_datasource.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/network/error_handler.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/domain/repository/startapp_repository.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

class StartappRepositoryImpl implements StartappRepository {
  final StartappRemoteDataSource _remoteDataSource;
  final StartAppLocalDataSource _startAppLocalDataSource;
  final NetworkInfo? _networkInfo;
  final S _s;

  StartappRepositoryImpl(this._remoteDataSource, this._startAppLocalDataSource,
      this._networkInfo, this._s);

  @override
  Future<Either<Failure, models.Session>> getSession() async {
    if (await _networkInfo?.isConnected ?? true) {
      final session = await _startAppLocalDataSource.getSession();
      print('session $session');
      if (session == null) {
        try {
          final session = await _remoteDataSource.getSession();
          _startAppLocalDataSource.putSession(session);
          return Right(session);
        } catch (e) {
          return Left(ErrorHandler.handle(e, _s).failure);
        }
      } else {
        return Right(session);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }
}
