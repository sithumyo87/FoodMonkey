import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_monkey/models/Tag.dart';

import '../models/Product.dart';
import '../utils/Constants.dart';
import '../utils/Global.dart';
import '../Helper/CustomGird.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Column(
        
        children: [
          _buildNavBar(),
          // Expanded(child: CustomGrid._makeCustomGrid(products)),
          Expanded(child: CustomGird.makeCustomGrid(products,refresh)),
        ],
      ),
    );
  }


  refresh(){
    setState(() {
      print(Global.cartsProduct.length);
    });
  }

 Widget _buildNavBar(){
    return Container(
      height:60,
      decoration: BoxDecoration(color: Constants.primary),
      child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) => _buildNavTitle(tags[index],index),
      )
    );
  }
  
  Widget _buildNavTitle(Tag tags,index){
    return GestureDetector(
      onTap: (() {
        setState(() {
          currentIndex = index;
        });
      }),
      child: Column(
      
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(tags.name,style: TextStyle(color: Constants.normal,fontWeight: FontWeight.bold),),
          ),
          Container(
            width: 60,
            height: 2,
            color: currentIndex == index ? Constants.secondary : Colors.transparent, 
          )
        ],
      ),
    );
  }
}