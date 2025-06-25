import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/Features/home/domain/entities/book_entities.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<BookEntity>>> getFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> getNewestBooks();
}
