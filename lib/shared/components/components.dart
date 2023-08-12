
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/update_product_page.dart';

import '../../models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key,
    required this.product}) : super(key: key);
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 40.0,
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  ),
                ]
            ),
            child:  Card(
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r"$""${product.price.toString()}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),),

                        const Icon(Icons.favorite_outlined,color: Colors.red,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     child: Image.network(product.image,height: 50,width: 70,),
          //   right: 30,
          //   bottom: 70,
          // ),
        ],
      ),
    );
  }
}

class TextFieldComponent extends StatelessWidget {
  TextFieldComponent(this.fieldName,{this.prefix,this.change,this.inputType});
  final String? fieldName;
  final Icon? prefix;
  TextInputType? inputType;
  final Function(String)? change;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: change,
      decoration:  InputDecoration(
        label: Text(
          fieldName!,
        ),
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: prefix,
      ),
      keyboardType: inputType,
    );}
}

class ButtonComponent extends StatelessWidget {
  ButtonComponent({this.buttonLabel,this.tapped});

  final String? buttonLabel;
  final VoidCallback? tapped;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: tapped,
      child: Container(
        width: double.infinity,
        height: 55.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey,

        ),
        child: Center(child: Text(
          buttonLabel!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,

          ),

        )),
      ),
    );
  }
}