import 'package:dartz/dartz.dart';
import 'package:deep_dive_mvvm/Features/home/data/model/book_model.dart';
import 'package:deep_dive_mvvm/Features/home/domain/entities/book_entities.dart';
import 'package:deep_dive_mvvm/constants.dart';
import 'package:deep_dive_mvvm/core/errors/failure.dart';
import 'package:deep_dive_mvvm/core/utils/api_services.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks();

  Future<List<BookEntity>> fetchFeaturedBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var res = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=programming",
    );

    List<BookEntity> books = getbooksList(res);
    saveData(books, kFeaturedBox);
    return books;


  }
  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
    var res = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=programming&Sorting=newest",
    );
    List<BookEntity> books = getbooksList(res);
    saveData(books, kNewestBox);
    return books;

  }
}
/////////////////////////

List<BookEntity> getbooksList(Map<String,dynamic> data ){
  List<BookEntity> books = [];
  for (var item in data["items"]) {
    books.add(BookModel.fromJson(item) as BookEntity);
  }
  return books;
}

void saveData(booksList,boxName){

  Hive.box(boxName).addAll(booksList);

}