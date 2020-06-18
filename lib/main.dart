import 'package:flutter/material.dart';
import 'package:flutter_food_ui/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'model/cart_item_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCart(),
      child: MaterialApp(
        title: 'Flutter Food UI',
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(),
      ),
    );
}


}
