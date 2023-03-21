import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
