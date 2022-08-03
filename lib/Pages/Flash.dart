import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_monkey/Pages/Home.dart';
import 'package:food_monkey/utils/Api.dart';

import '../Helper/TrainglePainter.dart';
import '../utils/Constants.dart';
import '../utils/Api.dart';
class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  loadinitialdata() async{
      var cats =await Api.getAllCat();
      var subcats =await Api.getAllSubs();
      var tags =await Api.getAllTags();
      if(cats && subcats && tags){
        Navigator.pushReplacementNamed(context,'/home');
      }else{
        print("Data Error");
      }
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadinitialdata();
  }
  Widget build(BuildContext context) {
      var screen = MediaQuery.of(context).size;
    

    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 150,left: 30),
          child: Text("Food Monkey",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Constants.normal),),
        ),
        Center(child: Image.asset("assets/images/fm.png",scale: 1.5,)),
        CustomPaint(
          painter: TrainglePainter(screen),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircularProgressIndicator(
                backgroundColor: Constants.normal,
                valueColor: AlwaysStoppedAnimation(Constants.accent),
              ),
              SizedBox(height: 150,)
            ],
          ),
        )
      ]),

    );
  }
}

