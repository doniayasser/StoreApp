import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

import '../shared/components/constants.dart';

class CategoryService
{
  Future<List<ProductModel>> getCategory({required String categoryName}) async
  {
    List<dynamic>data= await Api().get(url: "${apiUrl}category/$categoryName");
    List<ProductModel>categoryList=[];
    for(int i=0;i<data.length;i++)
      {
        categoryList.add(ProductModel.fromJson(data[i]));
      }
    return categoryList;
  }
  
}