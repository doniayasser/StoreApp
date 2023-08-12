import '../helper/api.dart';
import '../models/product_model.dart';
import '../shared/components/constants.dart';

class AllProducts
{
  Future<List<dynamic>> getAllProducts() async
  {
    List<dynamic> data= await Api().get(url: apiUrl);
    List<dynamic> productList=[];
    print(data.length);

    for(int i=0;i<data.length;i++)
      {
        productList.add(data[i]);
      }
    print(productList[0]);
    return productList;

  }

}