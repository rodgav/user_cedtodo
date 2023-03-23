import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/authenticator/data/data_source/remote_datasource.dart';
import 'package:user_cedtodo/authenticator/data/request/create_email_request.dart';
import 'package:user_cedtodo/authenticator/data/request/create_request.dart';
import 'package:user_cedtodo/authenticator/data/request/update_recovery_request.dart';
import 'package:user_cedtodo/authenticator/domain/repository/authenticator_repository.dart';
import 'package:user_cedtodo/startapp/data/network/error_handler.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/data/network/network_info.dart';
import 'package:user_cedtodo/startapp/internationalization/intl/l10n.dart';

class AuthenticatorRepositoryImpl extends AuthenticatorRepository {
  final AuthenticatorRemoteDataSource _authenticatorRemoteDataSource;
  final NetworkInfo? _networkInfo;
  final S _s;

  AuthenticatorRepositoryImpl(
      this._authenticatorRemoteDataSource, this._networkInfo, this._s);

  @override
  Future<Either<Failure, Account>> create(CreateRequest createRequest) async {
    if (await _networkInfo?.isConnected ?? true) {
      try {
        final account =
            await _authenticatorRemoteDataSource.create(createRequest);
        return Right(account);
      } catch (e) {
        return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(
        DataSource.no_internet_connection.getFailure(0, _s),
      );
    }
  }

  @override
  Future<Either<Failure, Session>> createEmailSession(
      CreateEmailRequest createEmailRequest) async {
    if (await _networkInfo?.isConnected ?? true) {
      try{
        final session = await _authenticatorRemoteDataSource
            .createEmailSession(createEmailRequest);
        return Right(session);
      }catch(e){
      return Left(ErrorHandler.handle(e, _s).failure);
      }
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, Token>> createRecovery(String email) async {
    if (await _networkInfo?.isConnected ?? true) {
      final session =
          await _authenticatorRemoteDataSource.createRecovery(email);
      return Right(session);
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }

  @override
  Future<Either<Failure, Token>> updateRecovery(
      UpdateRecoveryRequest updateRecoveryRequest) async {
    if (await _networkInfo?.isConnected ?? true) {
      final session = await _authenticatorRemoteDataSource
          .updateRecovery(updateRecoveryRequest);
      return Right(session);
    } else {
      return Left(DataSource.no_internet_connection.getFailure(0, _s));
    }
  }
}
