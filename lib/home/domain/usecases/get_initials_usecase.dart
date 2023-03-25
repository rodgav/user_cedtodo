import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:user_cedtodo/home/domain/repository/home_repository.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';
import 'package:user_cedtodo/startapp/domain/usecase/base_usecase.dart';

class GetInitialsUseCase implements BaseUseCase<Object?, Uint8List> {
  final HomeRepository _homeRepository;

  GetInitialsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, Uint8List>> execute(Object? input) =>
      _homeRepository.getInitials();
}
