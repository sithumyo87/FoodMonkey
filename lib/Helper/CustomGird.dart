import 'package:flutter/material.dart';
import 'package:food_monkey/utils/Global.dart';

import '../models/Product.dart';
import '../utils/Constants.dart';

class CustomGird{
  static Widget makeCustomGrid(List<Product> products,Function changeState){
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) => _viewGrid(products[index],changeState),
    );
  }


  static Widget _viewGrid(Product product,Function changeState){
    return Card(
      child: Column(
        children: [
          Text(product.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Constants.normal),),
          Image.asset("assets/images/${product.image}",width: 120,height: 120,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(onTap: (){
                Global.addToCart(product);
                changeState();
                // print(Global.cartsProduct.length);
              },child: Icon(Icons.shopping_basket,color: Constants.accent,)),
              SizedBox(height: 10,),
              Text("3200 MMK",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Icon(Icons.remove_red_eye,color: Constants.accent,),
              SizedBox(height: 10,),
            ],
          )
        ],
      ),
    );
  }
 
}