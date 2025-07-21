import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';

abstract class UseCase<Type > {
  Future<Either<Failure, Type>> call();
}
