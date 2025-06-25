import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';

abstract class UseCase<Type , Params> {
  Future<Either<Failure, Type>> call({Params param});
}
