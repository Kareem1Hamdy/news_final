import 'package:news_app/Api/model/sourceModel.dart';

class NewsModel{
  SourceModel? source;
  String? title;
  String? author;
  String? description;
  String? urlToImage;
  String? publishedAt;

  NewsModel.fromJson(Map<String,dynamic> data){
    title=data['title'];
    author=data['author'];
    description=data['description'];
    urlToImage=data['urlToImage'];
    publishedAt=data['publishedAt'];
    source= SourceModel.fromJson(data['source']);
  }
}