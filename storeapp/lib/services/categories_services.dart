import 'package:storeapp/api_helper/api.dart';
import 'package:storeapp/models/product_model.dart';

String value = 'https://fakestoreapi.com/';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProduct(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(url: '$value/category/$categoryName');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
