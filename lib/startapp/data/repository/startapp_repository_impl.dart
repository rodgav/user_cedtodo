import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/data_source/startapp_remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/network/error_handler.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/domain/repository/startapp_repository.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

class StartappRepositoryImpl implements StartappRepository {
  final StartappRemoteDataSource _remoteDataSource;
  final NetworkInfo? _networkInfo;
  final S _s;

  StartappRepositoryImpl(this._remoteDataSource, this._networkInfo, this._s);

  @override
  Future<Either<Failure, models.Session>> getSession() async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final session = await _remoteDataSource.getSession();
        return Right(session);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }
}
