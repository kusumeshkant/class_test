import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:noteapp/api_constants.dart';
import 'package:noteapp/model/product_listModel.dart';

class ProductServices extends GetxController {
  var productsList = [].obs;

  //obs is obsever
  ProductModel? productModel;

  getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.productsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        // var p = json.decode(response.body);
        // print(p.title);
        productModel = productModelFromJson(response.body);
        productsList.value = productModel!.products!;
        print(productModel!.total);
        print(productsList);
        print("after productModel");
        print(productModel);
        return productModel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
