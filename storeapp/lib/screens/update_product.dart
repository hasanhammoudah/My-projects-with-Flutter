import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/widgets/custom_button.dart';
import 'package:storeapp/screens/widgets/custom_text_field.dart';
import 'package:storeapp/services/get_all_product_services.dart';
import 'package:storeapp/services/update_products_services.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'Update Product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? ProductName, desc, image;
  String? price;
  bool isLoading = false;
  @override
  void initState() {
    AllProductsService().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      ProductName = data;
                    },
                    hintText: 'Product Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Description',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: 'Price',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButon(
                    text: 'Update',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await UpdateProduct(product);
                        print('success');
                      } on Exception catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id!,
        title: ProductName == null ? product.title.toString() : ProductName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description.toString() : desc!,
        image: image == null ? product.image.toString() : image!,
        category: product.category.toString());
  }
}
