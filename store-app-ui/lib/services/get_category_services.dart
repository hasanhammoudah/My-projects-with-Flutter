import 'package:storeapp/api_helper/api.dart';

String url = 'https://fakestoreapi.com/';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: '$url/categories');
    return data;
  }
}
