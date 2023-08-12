import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

import '../shared/components/components.dart';

class UpdateProductPage extends StatelessWidget {
   UpdateProductPage({Key? key}) : super(key: key);

  static String id="UpdateProductPage";
   String? productName,productPrice,productDesc,productImg;
   ProductModel? productData;

  @override
  Widget build(BuildContext context) {
    productData=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 105.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldComponent("Product Name",change: (data){productName=data;},inputType: TextInputType.name),
              const SizedBox(height: 20.0,),
              TextFieldComponent("Product Price",change: (data){productPrice=data;},inputType: TextInputType.number,),
              const SizedBox(height: 20.0,),
              TextFieldComponent("Product Description",change: (data){productDesc=data;},inputType: TextInputType.name),
              const SizedBox(height: 20.0,),
              TextFieldComponent("Product Image",change: (data){productImg=data;},inputType: TextInputType.url),
              const SizedBox(height: 40.0,),
              ButtonComponent(buttonLabel: "Update",tapped: (){
                UpdateProductService().updateProduct(
                    title: productName!,
                    price: productPrice!,
                    desc: productDesc!,
                    image: productImg!,
                    category: productData!.category);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
