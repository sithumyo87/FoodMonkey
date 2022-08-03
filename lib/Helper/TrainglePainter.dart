import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class TrainglePainter extends CustomPainter{
  var mSize;
  TrainglePainter(this.mSize);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var paint = Paint();
    paint.color  = Constants.accent;

    var pathup = Path();
    pathup.moveTo(mSize.width/3, 0);
    pathup.lineTo(mSize.width, 0);
    pathup.lineTo(mSize.width, mSize.height/3);
    pathup.close();

    var pathdown = Path();
    pathdown.moveTo(0,(mSize.height/3)*2);
    pathdown.lineTo(0, mSize.height);
    pathdown.lineTo((mSize.width/5)*3,mSize.height);
    pathdown.close();

    canvas.drawPath(pathup, paint);
    canvas.drawPath(pathdown, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError(
      
    ); 
  }

}