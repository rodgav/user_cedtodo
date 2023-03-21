import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, dynamic>> getSession() async {
    final dyn = await _remoteDataSource.getSession();
    return Right(dyn);
  }
}
