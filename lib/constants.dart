import 'package:flutter/material.dart';

//colors
Color mainColor = Color.fromRGBO(255, 204, 0, 1);

//textStyle
final headerStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
final titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
final titleStyle3 = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
final titleStyle2 = TextStyle(fontSize: 16, color: Colors.black45);
final subtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

//Shape
final roundedRectangle12 = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(12),
);

final roundedRectangle4 = RoundedRectangleBorder(
  borderRadius: BorderRadiusDirectional.circular(4),
);

final roundedRectangle40 = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
);
