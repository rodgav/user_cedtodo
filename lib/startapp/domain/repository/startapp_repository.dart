import 'package:appwrite/models.dart'as models;
import 'package:dartz/dartz.dart';
import 'package:user_cedtodo/startapp/data/network/failure.dart';

abstract class StartappRepository {
  Future<Either<Failure, models.Session>> getSession();
}
