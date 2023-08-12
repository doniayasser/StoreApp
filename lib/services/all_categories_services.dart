import '../helper/api.dart';
import '../shared/components/constants.dart';

class AllCategories
{
  Future<List<dynamic>> getAllCategories() async
  {
    List<dynamic> data= await Api().get(url: "${apiUrl}categories") ;
    return data;
  }
}