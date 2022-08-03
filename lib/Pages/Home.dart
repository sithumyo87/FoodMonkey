import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_monkey/utils/Constants.dart';

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
            _buildTitleBar("Category"),
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
               child:Text(txt,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Constants.normal),),
            );
  }
}