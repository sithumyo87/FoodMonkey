import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_monkey/models/Category.dart';
// import 'package:food_monkey/utils/Constants.dart';

import '../utils/Constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleBar("Tags"),
            Container(
              height: 150,
              child: Swiper(itemCount: tags.length,
              itemBuilder: (context, index) => Image.asset('assets/images/${tags[index].image}') ,
              viewportFraction:0.5,
              scale:0.5,
              ),
            ),
            SizedBox(height: 30,),
            _buildTitleBar("Category"),
            Expanded(child: GridView.builder(itemCount: cats.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 5,childAspectRatio: 1.5),itemBuilder: (context, index) => _buildCategoryCard(cats[index]))),
          ],
        ),
      ),
    )
    ;
  }
  Widget _buildTitleBar(txt){
    return Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
                color:Constants.secondary,
              ),
               child:Text(txt,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Constants.normal),),
            );
  }
  Widget _buildCategoryCard(Category cat){
    return Card(
      child:Image.asset('assets/images/${cat.image}'),
    );
  }
}