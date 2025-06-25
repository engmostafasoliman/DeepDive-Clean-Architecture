import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/Features/home/domain/entities/book_entities.dart';
import 'package:deep_dive_mvvm/Features/home/domain/repos/home_repo.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';
import 'package:deep_dive_mvvm/core/usecases/no_param_usecase.dart';

class GetFeaturedBooksUseCase extends UseCase<List<BookEntity>>{
  final HomeRepo homeRepo ;
  GetFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.getFeaturedBooks();

  }
}
