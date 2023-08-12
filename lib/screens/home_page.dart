import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/services/all_products_services.dart';

import '../models/product_model.dart';
import '../shared/components/components.dart';


class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);
   static String id="HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
            child: Text(
              "New Trend",
              style: TextStyle(
                  color: Colors.black,
                fontSize: 20.0,
              ),)),
        actions: [
          IconButton(
            onPressed: (){},
              icon: const Icon(Icons.shopping_cart_rounded,color: Colors.black,),
          )],

      ),
      body:
      Padding(
        padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 80.0),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProducts().getAllProducts(),
          builder: (context,snapshot)
          {
            if(snapshot.hasData)
              {
                List<ProductModel> products=snapshot.data!;
                print(products[0]);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 100.0,
                    childAspectRatio: 1.8,

                  ),
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    return CustomCard(product: products[index]);
                  },
                  clipBehavior: Clip.none,
                );
              }
            else
              {
                return const Center(child: CircularProgressIndicator());
              }
          }
          ,
        ),
      ),
    );
  }
}


