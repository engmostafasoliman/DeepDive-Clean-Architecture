import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/Features/home/domain/entities/book_entities.dart';
import 'package:deep_dive_mvvm/Features/home/domain/repos/home_repo.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';

class HomeRepoImp extends HomeRepo {
  @override
  Future<Either<Failure, List<BookEntity>>> getFeaturedBooks() {
    // TODO: implement getFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }
}