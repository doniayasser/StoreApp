import 'package:store_app/helper/api.dart';
import 'package:store_app/shared/components/constants.dart';
import '../models/product_model.dart';

class UpdateProductService
{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async
  {
    Map<String,dynamic> data=await Api().post(url: apiUrl, body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}