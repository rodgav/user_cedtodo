import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, dynamic>> getSession();
}
