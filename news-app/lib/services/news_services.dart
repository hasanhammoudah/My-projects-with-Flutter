import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getGeneralNews() async {
   Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=3014a43170a54131a94fc44c664d5059&country=us&category=general');

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      // print(article['author']);
      ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description']);
      articlesList.add(articleModel);
    }
   // print(articlesList);
    return articlesList;
  }
}
