import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:deep_dive_mvvm/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:deep_dive_mvvm/Features/home/domain/entities/book_entities.dart';
import 'package:deep_dive_mvvm/Features/home/domain/repos/home_repo.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';

class HomeRepoImp extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> getFeaturedBooks() async{
    try {
      var boxList = homeLocalDataSource.fetchFeaturedBooks();
      if (boxList.isEmpty) {
        return right(boxList);
      }
      var book=await homeRemoteDataSource.fetchFeaturedBooks();
return right(book);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getNewestBooks()async {
    try {
      var boxList = homeLocalDataSource.fetchNewestBooks();
      if (boxList.isEmpty) {
        return right(boxList);
      }
      var book=await homeRemoteDataSource.fetchNewestBooks();
      return right(book);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
