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

class AuthenticatorRepositoryImpl implements AuthenticatorRepository {
  final AuthenticatorRemoteDataSource _authenticatorRemoteDataSource;
  final NetworkInfo _networkInfo;
  final S _s;

  AuthenticatorRepositoryImpl(
      this._authenticatorRemoteDataSource, this._networkInfo, this._s);

  @override
  Future<Either<Failure, Account>> create(CreateRequest createRequest) async {
    if(await _networkInfo.isConnected){
      try {
        final account =
        await _authenticatorRemoteDataSource.create(createRequest);
        Right(account);
      } catch (e) {
        Left(ErrorHandler.handle(e, _s));
      }
    }else{Left(ErrorHandler.handle(DataSource.no_internet_connection, _s));
    }

  }

  @override
  Future<Either<Failure, Session>> createEmailSession(
      CreateEmailRequest createEmailRequest) {
    // TODO: implement createEmailSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Token>> createRecovery(String email) {
    // TODO: implement createRecovery
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Token>> updateRecovery(
      UpdateRecoveryRequest updateRecoveryRequest) {
    // TODO: implement updateRecovery
    throw UnimplementedError();
  }
}
